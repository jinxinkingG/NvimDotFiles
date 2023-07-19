local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local buf_group = augroup("bufferline",{ clear = true })
--autocmd("BufDelete",{
--	desc = "quit nvim when no buffers",
--	group = buf_group,
--	callback = function (args)
--		if TableLength(vim.api.nvim_list_bufs()) == 0 then
--			vim.cmd.qall()
--		end
--	end
--})
