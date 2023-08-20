---@diagnostic disable: missing-fields
return require("lazy").setup({
	-- TODO heirline
	{
		'rebelot/heirline.nvim',
		enabled = false,
		config = function ()
			require('configs.heirline')
		end
	},
	-- flash nvim, vim motion
	{
		'folke/flash.nvim',
		event = "VeryLazy",
		opts = {},
		keys = {
 			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
 			{ "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
 			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
 			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
 			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
 		},
	},
	-- neodev.nvim
	{ "folke/neodev.nvim", opts = {} },
	--nvim-dap
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
			  dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
			  dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
			  dapui.close()
			end
		end,
		dependencies = {
			{
				'theHamsta/nvim-dap-virtual-text',
				config = function()
					require("nvim-dap-virtual-text").setup({})
				end
			},
			{
				'rcarriga/nvim-dap-ui',
				config = function()
					require("dapui").setup()
				end
			},
		}
	},
	--nvim-jdtls
	{
		"mfussenegger/nvim-jdtls",
		lazy = true
	},
	-- icons for lsp
	{
		"onsails/lspkind.nvim",
		lazy = true,
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
		event = "LspAttach",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("configs.trouble"),
	},
	--null-ls.nvim
	{
		"jose-elias-alvarez/null-ls.nvim",
		enabled = false,
		event = {"BufNewFile","BufReadPost"},
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
		event ={"BufReadPost","BufNewFile"},
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
		event ={"BufReadPost","BufNewFile"},
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
		event = {"BufReadPost","BufNewFile"},
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
		event = {"BufReadPost","BufNewFile"},
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
		dependencies = {
			{
				'nvimdev/lspsaga.nvim',
				config = function()
				    require('lspsaga').setup({})
				end,
				dependencies = {
				    'nvim-treesitter/nvim-treesitter', -- optional
				    'nvim-tree/nvim-web-devicons'     -- optional
				}
			}
		}
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
		config = function()
			require("configs.mason-lspconfig")
		end,
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = {"BufReadPost","BufNewFile"},
		build = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
	},
	-- mappings
	{
		"folke/which-key.nvim",
		event = {"BufReadPost","BufNewFile"},
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
	--colorscheme
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
	-- motion
	{
		"phaazon/hop.nvim",
		enabled = false,
		event ={"BufReadPost","BufNewFile"},
		config = function()
			require("hop").setup()
		end,
	},
	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
