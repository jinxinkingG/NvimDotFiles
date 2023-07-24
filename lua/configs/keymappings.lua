local wk = require("which-key")
-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- base key mappings
wk.register({
j={k={"<esc>","exit insert mode"}}
},{ slient = true, nowait = true, mode = "i"});
wk.register({
["<leader>"]={
	w={":w<CR>","save"},
	m={":Mason<CR>","Mason"},
	q={":q<CR>","exit"},
	Q={":q!<CR>","exit"},
}
},{ slient = true, nowait = true, mode = "n"});
wk.register({q = {"<esc>","exit visual mode"}},{mode = "v",nowait = true})

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
	["<leader>"]={
		-- nvim-tree key mappings
		e ={
			name = "Nvim-Tree",
			e = { "<cmd>NvimTreeToggle<cr>","Open Or Close NvimTree"},
			f = { "<cmd>NvimTreeFocus<cr>","NvimTree Focus"},
			s = { "<cmd>NvimTreeFindFile!<cr>","Opened File Focus in NvimTree"},
		},
		-- hop key mappings
		h ={
			name = "Hop",
			l = { "<cmd>HopLine<cr>","Hop Line"},
			w = { "<cmd>HopWord<cr>","Hop Word"},
			a = { "<cmd>HopAnywhere<cr>","Hop Anywhere"},
		},
		b ={
		--bufferline key mappings
			name = "bufferline",
			b = {"<cmd>BufferLinePick<CR>","Pick a tab"},
			c = {"<cmd>BufferLinePickClose<CR>","Pick a tab and Close"},
		},
		-- telescope key mappings
		f ={
			name = "Telescope",
			f = { "<cmd>Telescope find_files<cr>","Find files"},
			w = { "<cmd>Telescope live_grep<cr>","Find word"},
			r = { "<cmd>Telescope oldfiles<cr>","Recent files"},
		},
		t = {
			name = "Trouble",
			t = {"<cmd>TroubleToggle<CR>","Toggle Trouble"},
			r = {"<cmd>TroubleRefresh<CR>","Refresh Trouble"}
		},
		l = {
			name = "LSP Server",
		},
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
			}
		}
	},
	[","]={
		name = 'Tab Action',
		q = {"<cmd>BufferLineCyclePre<CR>","Pick previous tab"},
		e = {"<cmd>BufferLineCycleNext<CR>","Pick next tab"},
		w = {"<cmd>bdelete<CR>|<cmd>buffer<CR>","Close current tab"}
		}
},n_opts)
