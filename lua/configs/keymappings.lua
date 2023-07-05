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
	q={":q!<CR>","exit"},
	w={":wq!<CR>","save and exit"}
}
},{ slient = true, nowait = true, mode = "n"});

-- nvim-tree key mappings
wk.register({
	["<leader>"]={
		e ={
			name = "Nvim-Tree",
			e = { "<cmd>NvimTreeToggle<cr>","Open Or Close NvimTree"},
			f = { "<cmd>NvimTreeFocus<cr>","NvimTree Focus"},
			s = { "<cmd>NvimTreeFindFile<cr>","Opened File Focus in NvimTree"},
		}
	}
},n_opts)

-- hop key mappings
wk.register({
	["<leader>"]={
		h ={
			name = "Hop",
			l = { "<cmd>HopLine<cr>","Hop Line"},
			w = { "<cmd>HopWord<cr>","Hop Word"},
			a = { "<cmd>HopAnywhere<cr>","Hop Anywhere"},
		}
	}
},n_opts)


-- telescope key mappings
wk.register({
	["<leader>"]={
		t ={
			name = "Telescope",
			f = { "<cmd>Telescope find_files<cr>","Find files"},
			w = { "<cmd>Telescope live_grep<cr>","Find word"},
		}
	}
},n_opts)

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
