require("neodev").setup({})
local coq = require("coq")
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup(coq.lsp_ensure_capabilities({
			capabilities = capabilities,
		}))
	end,
	-- java-language-server
	["jdtls"] = function()
		local jdtls = require("jdtls")
		local extendedClientCapabilities = jdtls.extendedClientCapabilities
		extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(),':p:h:t')
		local config = {
			filetypes = { "java" },
			capabilities = capabilities,
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx4g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				"/Users/jinxin/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar",
				"-configuration",
				"/Users/jinxin/.local/share/nvim/mason/packages/jdtls/config_mac",
				"-data",
				"/Users/jinxin/.cache/jdtls/workspace" .. project_name,
			},
			init_options = {
				--jvm_args = {},
				--workspace = "/Users/jinxin/.cache/jdtls/workspace"
			},
			settings = {
				java = {
					project = {
						referencedLibraries = {},
						sourcePaths = {'src/main/java'}
					},
					import = {
						maven = {
							 enabled = true
						 }
					},
					-- jdt = {
					--   ls = {
					--     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx2G -Xms100m -javaagent:/Users/jinxin/.local/share/nvim/mason/packages/jdtls/lombok.jar"
					--   }
					-- },
					eclipse = {
						downloadSources = true,
					},
					configuration = {
						updateBuildConfiguration = "interactive",
						runtimes = {
							{
								name = "JavaSE-1.8",
								path = "/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home"
							},
							{
								name = "JavaSE-11",
								path = "/Library/Java/JavaVirtualMachines/jdk-11.0.13.jdk/Contents/Home"
							},
							{
								name = "JavaSE-17",
								path = "/Library/Java/JavaVirtualMachines/jdk-17.0.3.1.jdk/Contents/Home"
							}
						},
					},
					maven = {
						downloadSources = true,
					},
					implementationsCodeLens = {
						enabled = true,
					},
					referencesCodeLens = {
						enabled = true,
					},
					references = {
						includeDecompiledSources = true,
					},
					format = {
						enabled = true,
						-- settings = {
						--   profile = "asdf"
						-- }
					},
				},
				signatureHelp = { enabled = true },
				completion = {
					favoriteStaticMembers = {
						"org.hamcrest.MatcherAssert.assertThat",
						"org.hamcrest.Matchers.*",
						"org.hamcrest.CoreMatchers.*",
						"org.junit.jupiter.api.Assertions.*",
						"java.util.Objects.requireNonNull",
						"java.util.Objects.requireNonNullElse",
						"org.mockito.Mockito.*",
					},
				},
				contentProvider = { preferred = "fernflower" },
				extendedClientCapabilities = extendedClientCapabilities,
				sources = {
					organizeImports = {
						starThreshold = 9999,
						staticStarThreshold = 9999,
					},
				},
				codeAction = {
					sortMembers = {
						avoidVolatileChanges = true
					}
				},
				codeGeneration = {
					toString = {
						template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
					},
					useBlocks = true,
				},
			},
		}
		local custom_jdtls_setup = require("plugins.jdtls_setup")
		config = custom_jdtls_setup.start_or_attach(config)
		lspconfig.jdtls.setup(config)
	end,
	--lua-language-server
	["lua_ls"] = function()
		lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
			filetypes = { "lua" },
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callSnipet = "Replace",
					},
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
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
			filetypes = { "json" },
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enbale = true },
				},
			},
		}))
	end,
})
