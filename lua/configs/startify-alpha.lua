return function()
	local startify= require "alpha.themes.startify"
	startify.section.header.val ={
   		  '███████╗██╗      █████╗ ███████╗██╗  ██╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
   		  '██╔════╝██║     ██╔══██╗██╔════╝██║  ██║    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
   		  '█████╗  ██║     ███████║███████╗███████║    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
   		  '██╔══╝  ██║     ██╔══██║╚════██║██╔══██║    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
   		  '██║     ███████╗██║  ██║███████║██║  ██║    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
   		  '╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
	}
	startify.section.top_buttons.val = {
		startify.button("f","🔭 Find Files",":Telescop find_files <CR>"),
		startify.button("u",' Plugins Update', ':Lazy update<CR>'),
		startify.button("e",' Create New File', ':ene <BAR> startinsert <CR>'),
		startify.button("q",'  Quit',':q!<CR>'),
	}
	startify.section.mru.val={
	{
		type = "padding",
		val = 10
	}
	}
	require("alpha").setup(startify.config)

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		desc = "Add Alpha dashboard footer",
		once = true,
		callback = function()
			local stats = require("lazy").stats()
			local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
			local footer = "AstroNvim loaded " .. stats.count .. " plugins  in " .. ms .. "ms"
			opts.section.footer.val = { type = "text", val = footer}
			--opts.section.footer.opts.hl = "DashboardFooter"
			pcall(vim.cmd.AlphaRedraw)
		end
	})
end
