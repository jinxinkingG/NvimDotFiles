local api = vim.api
local lsp = vim.lsp
local M = {}

local status_callback = function(_, result)
  api.nvim_command(string.format(':echohl Function | echo "%s" | echohl None',
                                string.sub(result.message, 1, vim.v.echospace)))
end

local function may_jdtls_buf(bufnr)
  if vim.bo[bufnr].filetype == "java" then
    return true
  end
  local fname = api.nvim_buf_get_name(bufnr)
  return vim.endswith(fname, "build.gradle") or vim.endswith(fname, "pom.xml")
end

local function attach_to_active_buf(bufnr, client_name)
  local function try_attach(buf)
    if not may_jdtls_buf(buf) then
      return false
    end
    local clients = vim.lsp.get_active_clients({ bufnr = buf, name = client_name })
    local _, client = next(clients)
    if client then
      lsp.buf_attach_client(bufnr, client.id)
      return true
    end
    return false
  end

  ---@diagnostic disable-next-line: param-type-mismatch
  local altbuf = vim.fn.bufnr("#", -1)
  if altbuf and altbuf > 0 and try_attach(altbuf) then
    return true
  end
  for _, buf in ipairs(api.nvim_list_bufs()) do
    if api.nvim_buf_is_loaded(buf) and try_attach(buf) then
      return true
    end
  end
  print('No active LSP client found to use for jdt:// document')
  return false
end

M.extendedClientCapabilities = {
  classFileContentsSupport = true;
  generateToStringPromptSupport = true;
  hashCodeEqualsPromptSupport = true;
  advancedExtractRefactoringSupport = true;
  advancedOrganizeImportsSupport = true;
  generateConstructorsPromptSupport = true;
  generateDelegateMethodsPromptSupport = true;
  moveRefactoringSupport = true;
  overrideMethodsPromptSupport = true;
  inferSelectionSupport = {
    "extractMethod",
    "extractVariable",
    "extractConstant",
    "extractVariableAllOccurrence"
  };
};


local function configuration_handler(err, result, ctx, config)
  local client_id = ctx.client_id
  local bufnr = 0
  local client = lsp.get_client_by_id(client_id)
  -- This isn't done in start_or_attach because a user could use a plugin like editorconfig to configure tabsize/spaces
  -- That plugin may run after `start_or_attach` which is why we defer the setting lookup.
  -- This ensures the language-server will use the latest version of the options
  client.config.settings = vim.tbl_deep_extend('keep', client.config.settings or {}, {
    java = {
      format = {
        insertSpaces = api.nvim_buf_get_option(bufnr, 'expandtab'),
        tabSize = lsp.util.get_effective_tabstop(bufnr)
      }
    }
  })
  return lsp.handlers['workspace/configuration'](err, result, ctx, config)
end

---@return string?, lsp.Client?
local function extract_data_dir(bufnr)
  -- Prefer client from current buffer, in case there are multiple jdtls clients (multiple projects)
  local client = vim.lsp.get_active_clients({ name = "jdtls", bufnr = bufnr })[1]
  if not client then
    -- Try first matching jdtls client otherwise. In case the user is in a
    -- different buffer like the quickfix list
    local clients = vim.lsp.get_active_clients({ name = "jdtls" })
    if vim.tbl_count(clients) > 1 then
      client = require('jdtls.ui').pick_one(
        clients,
        'Multiple jdtls clients found, pick one: ',
        function(c) return c.config.root_dir end
      )
    else
      client = clients[1]
    end
  end

  if client and client.config and client.config.cmd then
    local cmd = client.config.cmd
    if type(cmd) == "table" then
      for i, part in pairs(cmd) do
        -- jdtls helper script uses `--data`, java jar command uses `-data`.
        if part == '-data' or part == '--data' then
          return client.config.cmd[i + 1], client
        end
      end
    end
  end

  return nil, nil
end


---@param client lsp.Client
---@param opts jdtls.start.opts
local function add_commands(client, bufnr, opts)
  local function create_cmd(name, command, cmdopts)
    api.nvim_buf_create_user_command(bufnr, name, command, cmdopts or {})
  end
  create_cmd("JdtCompile", "lua require('jdtls').compile(<f-args>)", {
    nargs = "?",
    complete = "custom,v:lua.require'jdtls'._complete_compile"
  })
  create_cmd("JdtSetRuntime", "lua require('jdtls').set_runtime(<f-args>)", {
    nargs = "?",
    complete = "custom,v:lua.require'jdtls'._complete_set_runtime"
  })
  create_cmd("JdtUpdateConfig", "lua require('jdtls').update_project_config()")
  create_cmd("JdtJol", "lua require('jdtls').jol(<f-args>)", {
    nargs = "*"
  })
  create_cmd("JdtBytecode", "lua require('jdtls').javap()")
  create_cmd("JdtJshell", "lua require('jdtls').jshell()")
  create_cmd("JdtRestart", "lua require('jdtls.setup').restart()")
  local ok, dap = pcall(require, 'dap')
  if ok then
    local command_provider = client.server_capabilities.executeCommandProvider or {}
    local commands = command_provider.commands or {}
    if not vim.tbl_contains(commands, "vscode.java.startDebugSession") then
      return
    end

    require("jdtls.dap").setup_dap(opts.dap or {})
    api.nvim_command "command! -buffer JdtUpdateDebugConfig lua require('jdtls.dap').setup_dap_main_class_configs({ verbose = true })"
    local redefine_classes = function()
      local session = dap.session()
      if not session then
        vim.notify('No active debug session')
      else
        vim.notify('Applying code changes')
        session:request('redefineClasses', nil, function(err)
          assert(not err, vim.inspect(err))
        end)
      end
    end
    api.nvim_create_user_command('JdtUpdateHotcode', redefine_classes, {
      desc = "Trigger reload of changed classes for current debug session",
    })
  end
end


---@class jdtls.start.opts
---@field dap? JdtSetupDapOpts


---@param opts? jdtls.start.opts
function M.start_or_attach(config, opts)
  opts = opts or {}
  assert(config, 'config is required')
  assert(
    config.cmd and type(config.cmd) == 'table',
    'Config must have a `cmd` property and that must be a table. Got: '
      .. table.concat(config.cmd, ' ')
  )
  config.name = 'jdtls'
  local on_attach = config.on_attach
  config.on_attach = function(client, bufnr)
    if on_attach then
      on_attach(client, bufnr)
    end
    add_commands(client, bufnr, opts)
  end

  local bufnr = api.nvim_get_current_buf()
  local bufname = api.nvim_buf_get_name(bufnr)
  -- Won't be able to get the correct root path for jdt:// URIs
  -- So need to connect to an existing client
  if vim.startswith(bufname, 'jdt://') then
    if attach_to_active_buf(bufnr, config.name) then
      return
    end
  end

  config.root_dir = function(fname)
	return  require'jdtls.setup'.find_root({'.git', 'gradlew', 'mvnw'}, fname) or vim.fn.getcwd()
    end
  config.handlers = config.handlers or {}
  config.handlers['language/status'] = config.handlers['language/status'] or status_callback
  config.handlers['workspace/configuration'] = config.handlers['workspace/configuration'] or configuration_handler
  local capabilities = vim.tbl_deep_extend('keep', config.capabilities or {}, lsp.protocol.make_client_capabilities())
  local extra_capabilities = {
    textDocument = {
      codeAction = {
        codeActionLiteralSupport = {
          codeActionKind = {
            valueSet = {
                "source.generate.toString",
                "source.generate.hashCodeEquals",
                "source.organizeImports",
            };
          };
        };
      }
    }
  }
  config.capabilities = vim.tbl_deep_extend('keep', capabilities, extra_capabilities)
  config.init_options = config.init_options or {}
  config.init_options.extendedClientCapabilities = (
    config.init_options.extendedClientCapabilities or vim.deepcopy(M.extendedClientCapabilities)
  )
  config.settings = vim.tbl_deep_extend('keep', config.settings or {}, {
    -- the `java` property is used in other places to detect the client as the jdtls client
    -- don't remove it without updating those places
    java = {
    }
  })
  --maybe_implicit_save()
  --vim.lsp.start(config)
  return config
end

return M
