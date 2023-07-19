require("neodev").setup({})
local coq = require "coq"
local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            lspconfig[server_name].setup (coq.lsp_ensure_capabilities({
		    capabilities = capabilities
	    }))
        end,
	-- java-language-server
	["jdtls"] = function()
		lspconfig.jdtls.setup(coq.lsp_ensure_capabilities({
			cmd = { "jdtls", "-configuration", "/Users/jinxin/.local/share/nvim/mason/packages/jdtls/config_mac", "-data", "/Users/jinxin/.local/share/nvim/mason/packages/jdtls/workspace" },
			init_options = {
				  jvm_args = {},
				  workspace = "/Users/jinxin/.local/share/nvim/mason/packages/jdtls/workspace"
			}
		}))
	end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["lua_ls"] = function ()
		--lua-language-server
		lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callSnipet = "Replace"
					},
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
		}))
	end,
	["jsonls"] = function()
		lspconfig.jsonls.setup(coq.lsp_ensure_capabilities({
			filetypes = {"json"},
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require('schemastore').json.schemas(),
					validate = { enbale = true }
				}
			}
		}))
	end
 }
