return require("lazy").setup({
	-- dashboard
	{
		"glepnir/dashboard-nvim",
		event="VimEnter",
		config=function()
			require("dashboard").setup(require('configs.dashboard'))
		end,
		dependencies = { {"nvim-tree/nvim-web-devicons"}}
	},
	-- bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config=function()
			require("bufferline").setup{}
		end
	},
	-- nvim-lspconfig
	{
		"neonvim/nvim-lspconfig",
		config=function()
			require("configs.lsp")
		end
	},
	-- mason.nvim
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpate updates registry contents
		config=function()
			require("mason").setup()
		end
	},
	-- mason-lspconfig.nvim
	{
		"williamboman/mason-lspconfig.nvim",
		config=function()
			require("mason-lspconfig").setup()
		end
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
  		config =function()
			require("configs.treesitter")
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
		cmd = "Telescope",
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
	-- neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch="v2.x",
		event="VimEnter",
		enabled=false,
		config=function()
			require('configs.neotree')
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim"
		}
	}

})
