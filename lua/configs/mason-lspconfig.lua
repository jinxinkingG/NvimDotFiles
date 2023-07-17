local lspconfig = require('lspconfig')
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            lspconfig[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["lua_ls"] = function ()
		--lua-language-server
		lspconfig.lua_ls.setup{
		  settings = {
		    Lua = {
		      runtime = {
		        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
		        version = 'LuaJIT',
		      },
		      diagnostics = {
		        -- Get the language server to recognize the `vim` global
		        globals = {'vim'},
		      },
		      workspace = {
		        -- Make the server aware of Neovim runtime files
		        library = vim.api.nvim_get_runtime_file("", true),
		      },
		      -- Do not send telemetry data containing a randomized but unique identifier
		      telemetry = {
		        enable = false,
		      },
		    },
		  },
		}
	end
 }