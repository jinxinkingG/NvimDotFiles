return function()
	local dashboard = require "alpha.themes.dashboard"
	dashboard.section.header.val ={
   		  '███████╗██╗      █████╗ ███████╗██╗  ██╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
   		  '██╔════╝██║     ██╔══██╗██╔════╝██║  ██║    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
   		  '█████╗  ██║     ███████║███████╗███████║    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
   		  '██╔══╝  ██║     ██╔══██║╚════██║██╔══██║    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
   		  '██║     ███████╗██║  ██║███████║██║  ██║    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
   		  '╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
	}
	dashboard.section.buttons.val = {
		dashboard.button("f","🔭 Find Files",":Telescop find_files <CR>"),
		dashboard.button("r"," Recent Files",":Telescop oldfiles<CR>"),
		dashboard.button("u",' Plugins Update', ':Lazy update<CR>'),
		dashboard.button("e",' Create New File', ':ene <BAR>startinsert<CR>'),
		dashboard.button("q",'  Quit',':q!<CR>'),
	}
	if vim.g.neovide then
		if vim.fn.has "mac" then
	dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.28) }
	dashboard.config.layout[3].val = 5
else
	dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.28) }
	dashboard.config.layout[3].val = 3
end
else
	if vim.fn.has "mac" then
	dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.15) }
	dashboard.config.layout[3].val = 4
else
	dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.1) }
	dashboard.config.layout[3].val = 2
end
end
	dashboard.config.opts.noautocmd = true
	return dashboard
end
