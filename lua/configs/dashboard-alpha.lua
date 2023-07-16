return function()
	local alpha = require "alpha"
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
		dashboard.button("e",' Create New File', ':e Untitle<CR>'),
		dashboard.button("q",'  Quit',':q!<CR>'),
	}
	if vim.g.neovide then
	dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.3) }
else
	dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.15) }
end
	dashboard.config.layout[3].val = 3
	dashboard.config.opts.noautocmd = true
	return dashboard
end
