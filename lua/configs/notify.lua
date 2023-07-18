return function(_, opts)
	vim.cmd[[set termguicolors]]
	local notify = require "notify"
	notify.setup(opts)
	vim.notify = notify
end
