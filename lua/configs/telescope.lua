require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["q"] = require("telescope.actions").close,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
		file_browser = {
			hijack_netrw = true
		}
	},
})
require("telescope").load_extension("ui-select")
require("telescope").load_extension("frecency")
require("telescope").load_extension("file_browser")
