vim.cmd[[set guifont=MesloLGL\ Nerd\ Font\ Mono:h12]]
-- remap leader
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
keymap("i", "jk","<Esc>",opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local timestamp = os.time()%5
print(timestamp)
local _switch = {
	[0]=function()
		vim.cmd[[colorscheme tokyonight-night]]
	end,
	[1]=function()
		vim.cmd[[colorscheme tokyonight-storm]]
	end,
	[4]=function()
		vim.cmd[[colorscheme tokyonight-day]]
	end,
	[3]=function()
		vim.cmd[[colorscheme tokyonight-moon]]
	end,
	[2]=function()
		vim.cmd[[colorscheme tokyonight-night]]
	end
}

-- random scheme
local switch=_switch[timestamp]
switch()
