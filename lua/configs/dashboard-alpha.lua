return function()
	local icons = require"core.icons"
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
		dashboard.button("f",icons.Search .. "  Find Files",":Telescop find_files <CR>"),
		dashboard.button("r",icons.History .. "  Recent Files",":Telescop oldfiles<CR>"),
		dashboard.button("u",icons.Sync .. '  Plugins Update', ':Lazy update<CR>'),
		dashboard.button("e",icons.CreateFile .. '  Create New File', ':ene <BAR>startinsert<CR>'),
		dashboard.button("q",icons.Exit .. '  Quit',':q!<CR>'),
	}
	dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
	dashboard.config.layout[3].val = 5
	dashboard.config.opts.noautocmd = true
	return dashboard
end
