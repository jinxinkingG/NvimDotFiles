return function()
	vim.cmd[[set termguicolors]]
	local notify = require "notify"
	notify.setup(
	{
		fps = 60,
	})
	vim.notify = notify
end
