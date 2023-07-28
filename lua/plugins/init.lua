---@diagnostic disable: missing-fields
return require("lazy").setup({
	--lsp saga
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			require('lspsaga').setup({})
		end
	},
	--coq.nvim
	{
		"ms-jpq/coq_nvim",
		lazy = true,
	},
	--nvim-dap
	{
		"mfussenegger/nvim-dap",
		lazy = true,
	},
	--nvim-jdtls
	{
		"mfussenegger/nvim-jdtls",
		lazy = true,
	},
	-- icons for lsp
	{
		"onsails/lspkind.nvim",
		event = "BufRead",
		config = require("configs.lspkind"),
	},
	--SchemaStore.nvim
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
	--trouble nvim
	{
		"folke/trouble.nvim",
		event = "BufRead",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("configs.trouble"),
	},
	--null-ls.nvim
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "LspAttach",
		config = function()
			require("configs.null-ls")
		end,
	},
	--nvim autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("configs.nvim-autopairs")
		end,
	},
	-- nvim notify
	{
		"rcarriga/nvim-notify",
		opts = {
			fps = 60,
			timeout = 3000,
		},
		config = require("configs.notify"),
	},
	--luasnip
	{
		"L3MON4D3/LuaSnip",
		event = "BufRead",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = { store_selection_keys = "<C-x>" },
		config = require("configs.luasnip"),
	},
	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-git",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"dcampos/cmp-snippy",
		},
		opts = function()
			require("configs.nvim-cmp")
		end,
	},
	{
		"hrsh7th/cmp-cmdline",
		event = "CmdlineEnter",
	},
	-- indent-blackline
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")
			require("indent_blankline").setup({
				show_current_context = true,
				show_current_context_start = true,
				show_end_line = true,
			})
		end,
	},
	-- nvim-web-devicons
	{
		"nvim-tree/nvim-web-devicons",
	},
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		event = "BufRead",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		config = function()
			require("configs.lualine")
		end,
	},
	-- dashboard
	{
		"glepnir/dashboard-nvim",
		enabled = false,
		event = "VimEnter",
		config = function()
			require("configs.dashboard")
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = require("configs.dashboard-alpha"),
		config = require("configs.alpha-config"),
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	-- bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		event = "BufAdd",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("configs.bufferline")
		end,
	},
	-- nvim-lspconfig
	{
		"neonvim/nvim-lspconfig",
		lazy = true,
	},
	-- mason.nvim
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpate updates registry contents
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
			"MasonUpdate",
			"MasonUpdateAll",
		},
		config = function()
			require("mason").setup()
		end,
	},
	-- mason-lspconfig.nvim
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufRead",
		config = function()
			require("configs.mason-lspconfig")
		end,
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		build = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
	},
	-- mappings
	{
		"folke/which-key.nvim",
		event = "BufRead",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("configs.whichkey")
		end,
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.telescope")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = true,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = true,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		lazy = true,
		dependencies = { "kkharji/sqlite.lua" },
	},
	--neoconf
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		config = function()
			require("neoconf").setup()
		end,
	},
	--neodev
	{
		"folke/neodev.nvim",
		lazy = true,
	},
	--colorscheme
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
	-- motion
	{
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require("hop").setup()
		end,
	},
	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufRead",
		config = function()
			require("configs.nvim-tree")
		end,
	},
	--	-- neo-tree
	--	{
	--		"nvim-neo-tree/neo-tree.nvim",
	--		branch="v2.x",
	--		event="VimEnter",
	--		enabled=false,
	--		config=function()
	--			require('configs.neotree')
	--		end,
	--		dependencies = {
	--			"nvim-tree/nvim-web-devicons",
	--			"nvim-lua/plenary.nvim",
	--			"MunifTanjim/nui.nvim"
	--		}
	--	}
})
