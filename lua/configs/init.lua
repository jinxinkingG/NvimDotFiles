if vim.g.neovide and vim.fn.has "mac" == 1 then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
  vim.cmd[[
	augroup cdpwd
	    autocmd!
	    autocmd VimEnter * cd ~/.config/nvim
	augroup END 
	" for dashboard no scroll
	augroup dashboard_au
	autocmd User dashboardReady setlocal scrolloff=999
	" Reset when leaving dashboard
	autocmd FileType dashboard autocmd BufLeave <buffer> setlocal scrolloff=0
	autocmd User dashboardReady setlocal mouse=
	" Reset when leaving dashboard
	autocmd FileType dashboard autocmd BufLeave <buffer> set mouse=a
	augroup END
	]]
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- change font
vim.o.guifont ="MesloLGL Nerd Font Mono:h14" 
-- set relativenumber
vim.wo.relativenumber = true

-- random theme
switch()

-- nvim tree recommend configs
	-- disable netrw at the very start of your init.lua
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true

-- keymappings
require("configs.keymappings")
