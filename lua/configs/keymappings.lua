local wk = require("which-key")

-- opts
local n_opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
  expr = false, -- use `expr` when creating keymaps		
}


local i_opts = {
  mode = "i", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
  expr = false, -- use `expr` when creating keymaps
}

wk.register({
	["g"] = {
		d = {"<cmd>Lspsaga goto_definition<CR>","Go to Denfinition"},
		t = {"<cmd>Lspsaga goto_type_definition<CR>","Go to Type Denfinition"},

	},
	["<leader>"]={
		--nvim dap
		d = {
			name ="DAP",
			b ={"<cmd>lua require('dap').toggle_breakpoint()<CR>","BreakPoint Toggle"},
			i ={"<cmd>lua require('dap').step_into()<CR>","Step into"},
			c ={"<cmd>lua require('dap').continue()<CR>","Continue"},
			o ={"<cmd>lua require('dap').step_over()<CR>","Step over"},
			r ={"<cmd>lua require('dap').repl_open()<CR>","repl open"},
			l ={"<cmd>lua require('dap').run_last()<CR>","run last"},
		},
		w = {
			name = "window",
			w = {'<C-W>w', 'other-window'},
			d = {'<C-W>c', 'delete-window'},
			['-'] = {'<C-W>s', 'split-window-below'},
			['|'] = {'<C-W>v', 'split-window-right'},
			['2'] = {'<C-W>v', 'layout-double-columns'},
			h = {'<C-W>h', 'window-left'},
			j = {'<C-W>j', 'window-below'},
			l = {'<C-W>l', 'window-right'},
			k = {'<C-W>k', 'window-up'},
			H = {'<C-W>5<', 'expand-window-left'},
			J = {'<cmd>resize +5<CR>', 'expand-window-below'},
			L = {'<C-W>5>', 'expand-window-right'},
			K = {'<cmd>resize -5<CR>', 'expand-window-up'},
			['='] = {'<C-W>=', 'balance-window'},
			s = {'<C-W>s', 'split-window-below'},
			v = {'<C-W>v', 'split-window-below'},
			['?'] = {'Windows', 'fzf-window'},

		},
		-- nvim-tree key mappings
		e ={
			name = "Nvim-Tree",
			t = { "<cmd>NvimTreeToggle<cr>","Open Or Close NvimTree"},
			e = { "<cmd>NvimTreeFocus<cr>","NvimTree Focus"},
			f = { "<cmd>NvimTreeFindFile!<cr>","Opened File Focus in NvimTree"},
		},
-- 		-- hop key mappings
-- 		h ={
-- 			name = "Hop",
-- 			l = { "<cmd>HopLine<cr>","Hop Line"},
-- 			w = { "<cmd>HopWord<cr>","Hop Word"},
-- 			a = { "<cmd>HopAnywhere<cr>","Hop Anywhere"},
--		},
		-- telescope key mappings
		f ={
			name = "Telescope",
			f = { "<cmd>Telescope find_files<cr>","Find files"},
			w = { "<cmd>Telescope live_grep<cr>","Find word"},
			r = { "<cmd>Telescope oldfiles<cr>","Recent files"},
			b = { "<cmd>Telescope file_browser<cr>","File browser"},
		},
		t = {
			name = "Trouble",
			t = {"<cmd>TroubleToggle<CR>","Toggle Trouble"},
			r = {"<cmd>TroubleRefresh<CR>","Refresh Trouble"}
		},
		l = {
			name = "LSP Server",

			f = {"<cmd>lua vim.lsp.buf.format({async = true})<CR>",'Format file'},
			c = {"<cmd>Lspsaga code_action<CR>",'Code Action'},

			i = {"<cmd>Lspsaga finder imp<CR>",'Find implements'},

			e = {"<cmd>Lspsaga finder def+ref<CR>",'Find implements'},

			r = {"<cmd>Lspsaga rename<CR>",'Rename'},

			d = {"<cmd>Lspsaga hover_doc<CR>","Show hover doc"},
		},
		x = {"<cmd>bdelete<CR>|<cmd>buffer<CR>","Close current tab"},
		o = {"<C-o>","go back"},
	i = {"<C-i>","go forward"},
	},
	["<tab>"] = {"<cmd>BufferLineCycleNext<CR>","Pick next tab"},
	["<S-tab>"] = {"<cmd>BufferLineCyclePre<CR>","Pick previous tab"},
},n_opts)
