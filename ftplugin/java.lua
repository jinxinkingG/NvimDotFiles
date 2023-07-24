local config = {
	cmd = {
		    -- 💀
		'java', -- or '/path/to/java17_or_newer/bin/java'
		        -- depends on if `java` is in your $PATH env variable and if it points to the right version.
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		-- 💀
		'-jar', 'C:\\Users\\jinxin\\AppData\\Local\\nvim-data\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar',
		     -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
		     -- Must point to the                                                     Change this to
		     -- eclipse.jdt.ls installation                                           the actual version
		-- 💀
		'-configuration', 'C:\\Users\\jinxin\\AppData\\Local\\nvim-data\\jdtls\\config_win',
		                -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		                -- Must point to the                      Change to one of `linux`, `win` or `mac`
		                -- eclipse.jdt.ls installation            Depending on your system.
		-- 💀
		-- See `data directory configuration` section in the README
		'-data', 'F:\\workspace\\'
		    },
	root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw','pom.xml'}, { upward = true })[1]),
	settings = {
		java = {
			completion = {
				enabled = true,
			},
			signatureHelp = { enabled = true },
			configuration = {
				updateBuildConfiguration = {
					disabled = 'disabled',
					interactive = 'interactive',
					automatic = 'automatic'
				},
				runtimes = {
					{
						name = "jdk8",
						path = "C:\\Program Files\\Java\\jdk-1.8\\jre",
						default = true
					},
					{
						name = "jdk11",
						path = "C:\\Program Files\\Java\\jdk-11.0.16.1\\jre"
					},
					{
						name = "jdk17",
						path = "C:\\Program Files\\Java\\jdk-17.0.7\\jre"
					}
				}
			},
		}
	}
}
require('jdtls').start_or_attach(config)
