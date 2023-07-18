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
	dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.35) }
	dashboard.config.layout[3].val = 2
else
	dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.1) }
	dashboard.config.layout[3].val = 2
end
	dashboard.config.opts.noautocmd = true
	return dashboard
end
