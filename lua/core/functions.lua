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
		vim.cmd[[colorscheme duskfox]]
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

function BufIsBig(bufnr)
	local max_filesize = 100*1024
	local ok,status = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
	if ok and status and status.size > max_filesize then
		return true
	else
		return false
	end
end
