return require("lazy").setup({
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate",
		config =function()
			require("which-key").setup(require("configs.nvim-treesitter"))
		end
	},
	-- mappings
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("which-key").setup(require("configs.whichkey"))
		end
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim"},
		config=function()
			require("telescope").setup(require("configs.telescope"))
		end
	},
  	--neoconf
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
  	--neodev
	{"folke/neodev.nvim"},
	--colorscheme
	{"folke/tokyonight.nvim",lazy =false,priority = 1000},
	{"EdenEast/nightfox.nvim",lazy =false,priority = 1000},
	-- motion
	{
		"phaazon/hop.nvim",
		event = "VeryLazy",
		config=function()
			require("hop").setup()
		end
	},
	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons"},
		event = "VeryLazy",
		config=function()
			require("nvim-tree").setup()
		end
	},
	-- dashboard
	{
		"glepnir/dashboard-nvim",
		event="VimEnter",
		config=function()
			require("dashboard").setup(require('configs.dashboard'))
		end,
		dependencies = { {"nvim-tree/nvim-web-devicons"}}
	}

})
