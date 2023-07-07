return require("lazy").setup({
	--nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
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
}
		end
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
  		config =function()
			require("nvim-treesitter.configs").setup{
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "lua", "json"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
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
