--close nvim statusline
vim.opt.laststatus=0
-- for neovide copy save etc.
if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

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
vim.keymap.set('n','<leader>u',':w<CR>:source %<CR>')
vim.keymap.set('i','jk','<esc>')
vim.keymap.set('i','jj','<esc>')
vim.keymap.set('v','q','<esc>')
vim.keymap.set('n',';',':')

-- change font
if vim.g.neovide then
vim.o.guifont ="DejaVuSansM Nerd Font Mono:h18"
end
-- set relativenumber
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.cursorline=true

-- random theme
SWITCH()

-- nvim tree recommend configs
	-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- use system clipboard
vim.o.clipboard='unnamedplus'

-- sign define
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
