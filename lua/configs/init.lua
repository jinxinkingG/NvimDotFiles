--close nvim statusline
vim.opt.laststatus=0

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Base keymaps not use whichkey
vim.keymap.set('n','<leader>q',':q<CR>')
vim.keymap.set('n','<leader>Q',':q!<CR>')
vim.keymap.set('n','<leader>w',':w<CR>')
vim.keymap.set('i','jk','<esc>')
vim.keymap.set('v','q','<esc>')

-- change font
vim.o.guifont ="DejaVuSansM Nerd Font:h14"
-- set relativenumber
vim.wo.relativenumber = true

-- random theme
SWITCH()

-- nvim tree recommend configs
	-- disable netrw at the very start of your init.lua
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true

