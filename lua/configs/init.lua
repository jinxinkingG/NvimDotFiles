require('configs.whichkey')
vim.g.guifont='MesloLGL Nerd Font Mono:h16'
local timestamp = os.time()%4
print(timestamp)
local _switch = {
	[0]=function()
		vim.cmd[[colorscheme tokyonight-night]]
	end,
	[1]=function()
		vim.cmd[[colorscheme tokyonight-storm]]
	end,
	[2]=function()
		vim.cmd[[colorscheme tokyonight-day]]
	end,
	[3]=function()
		vim.cmd[[colorscheme tokyonight-moon]]
	end,
	[4]=function()
		vim.cmd[[colorscheme tokyonight-night]]
	end
}

local switch=_switch[timestamp]
switch()
