--close nvim statusline
vim.opt.laststatus=0
-- change font
vim.o.guifont ="MesloLGL Nerd Font Mono:h14"
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

