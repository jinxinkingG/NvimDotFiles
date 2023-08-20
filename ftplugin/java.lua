local jdtls = require("jdtls")
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(),':p:h:t')

-- This is the new part
local bundles = {
	vim.fn.glob("/Users/jinxin/Tools/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.48.0.jar",1)
}
vim.list_extend(bundles, vim.split(vim.fn.glob("/Users/jinxin/Tools/vscode-java-test/server/*.jar", 1), "\n"))
local config = {
	filetypes = { "java" },
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
		"/Users/jinxin/Tools/jdtls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar",
		"-configuration",
		"/Users/jinxin/Tools/jdtls/org.eclipse.jdt.ls.product/target/repository/config_mac",
		"-data",
		"/Users/jinxin/.cache/jdtls/workspace" .. project_name,
	},
	init_options = {
		bundles = bundles;
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
jdtls.start_or_attach(config)
local wk = require('which-key')
wk.register({
	['<leader>'] = {
		j = {
			name = "JDT Language Server",
			o = {"<cmd>lua require'jdtls'.organize_imports()<CR>","organize imports"},
			p = {"<cmd>lua require'jdtls'.javap()<CR>","Javap"},
			c = {
				name = "Compile",
				f = {"<cmd>lua require'jdtls'.compile('full')<CR>","compile full project"},
				i = {"<cmd>lua require'jdtls'.compile('incremental')<CR>","compile incremental"},
			},
			u = {"<cmd>lua require'jdtls'.update_project_config({select_mode = 'prompt'})<CR>","Update project config"},
			e = {
				name = "extract actions",
				o = {"<cmd>lua require'jdtls'.extract.opts<CR>","extract opts"},
				c = {"<cmd>lua require'jdtls'.extract_contant()<CR>","extract constant"},
				v = {"<cmd>lua require'jdtls'.extract_variable()<CR>","extract variable"},
				a = {"<cmd>lua require'jdtls'.extract_variable_all()<CR>","extract variable all"},
			},
			d = {"<cmd>lua require('jdtls.dap').setup_dap_main_class_configs()<CR>","setup main class"},
			t = {
				name = "run test",
				m = {"<cmd>lua require'jdtls'.test_nearest_method()<CR>","test nearest method"},
				c = {"<cmd>lua require'jdtls'.test_class()","test class"}
			}
		}

	}
})
