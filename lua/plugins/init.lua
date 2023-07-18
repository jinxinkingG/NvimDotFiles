return require("lazy").setup({
	--SchemaStore.nvim
	{
		"b0o/schemastore.nvim",
		lazy = true
	},
	--trouble nvim
	{
		"folke/trouble.nvim",
		event = "BufRead",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("configs.trouble")
	},
	--null-ls.nvim
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		config = function ()
			require("configs.null-ls")
		end
	},
	--nvim autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config =function()
			require("configs.nvim-autopairs")
		end
	},
	-- nvim notify
	{
		"rcarriga/nvim-notify",
		config = require("configs.notify")
	},
	--luasnip
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
    		build = vim.fn.has "win32" == 0
        		and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
      		or nil,
    		dependencies = { "rafamadriz/friendly-snippets" },
    		opts = { store_selection_keys = "<C-x>" },
		config = require "configs.luasnip",
	},
	{
		"doxnit/cmp-luasnip-choice",
		event = "InsertEnter",
		config = function()
			require('cmp_luasnip_choice').setup({
				auto_open = true,
			})
		end,
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
		"dcampos/cmp-snippy"
		},
		opts = function()
			require('configs.nvim-cmp')
		end

	},
	{
		"hrsh7th/cmp-cmdline",
		event = "CmdlineEnter"
	},
	-- indent-blackline
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config=function()
			vim.opt.list = true
			vim.opt.listchars:append "space:⋅"
			vim.opt.listchars:append "eol:↴"
			require("indent_blankline").setup{
				show_current_context = true,
				show_current_context_start = true,
				show_end_line = true
			}
		end
	},
	-- nvim-web-devicons
	{
		"nvim-tree/nvim-web-devicons"
	},
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		event = "BufRead",
		dependencies = { {"nvim-tree/nvim-web-devicons"}},
		config=function()
		require('configs.lualine')
	end
	},
	-- dashboard
	{
		"glepnir/dashboard-nvim",
		enabled=false,
		event="VimEnter",
		config=function()
			require('configs.dashboard')
		end,
		dependencies = { {"nvim-tree/nvim-web-devicons"}}
	},
	{
		"goolord/alpha-nvim",
		event="VimEnter",
		opts=require('configs.dashboard-alpha'),
		config=require('configs.alpha-config'),
		dependencies = { {"nvim-tree/nvim-web-devicons"}}
	},
	-- bufferline.nvim
	{
		"akinsho/bufferline.nvim",
		event = "BufAdd",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config=function()
			require("configs.bufferline")
		end
	},
	-- nvim-lspconfig
	{
		"neonvim/nvim-lspconfig",
		lazy = true
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
		config=function()
			require("mason").setup()
		end
	},
	-- mason-lspconfig.nvim
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufRead",
		config=function()
			require("configs.mason-lspconfig")
		end
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		build = ":TSUpdate",
  		config =function()
			require("configs.treesitter")
		end
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
		end
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim"},
		config=function()
			require("configs.telescope")
		end
	},
  	--neoconf
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		config=function()
			require("neoconf").setup()
		end
		},
  	--neodev
	{"folke/neodev.nvim",enabled = false},
	--colorscheme
	{"folke/tokyonight.nvim",lazy =false,priority = 1000},
	{"EdenEast/nightfox.nvim",lazy =false,priority = 1000},
	-- motion
	{
		"phaazon/hop.nvim",
		event = 'BufRead',
		config=function()
			require("hop").setup()
		end
	},
	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons"},
		event = 'BufRead',
		config=function()
			require("nvim-tree").setup()
		end
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
