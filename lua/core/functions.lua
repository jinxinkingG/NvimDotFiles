local _switch = {
	[0]=function()
		vim.cmd[[colorscheme tokyonight-night]]
	end,
	[1]=function()
		vim.cmd[[colorscheme tokyonight-storm]]
	end,
	[2]=function()
		vim.cmd[[colorscheme tokyonight-moon]]
	end,
	[3]=function()
		vim.cmd[[colorscheme nightfox]]
	end,
	[4]=function()
		vim.cmd[[colorscheme dayfox]]
	end,
	[5]=function()
		vim.cmd[[colorscheme dawnfox]]
	end,
	[6]=function()
		vim.cmd[[colorscheme nordfox]]
	end,
	[7]=function()
		vim.cmd[[colorscheme duskfox]]
	end,
	[8]=function()
		vim.cmd[[colorscheme carbonfox]]
	end,
	[9]=function()
		vim.cmd[[colorscheme terafox]]
	end
}
function SWITCH()
	_switch[os.time()%10]()
end
function TableLength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end
