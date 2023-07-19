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
-- default sources for all buffers
local cmp = require('cmp')
local default_cmp_sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'nvim_lsp_signature_help' },
}, {
	{ name = 'luasnip' },
	{ name = 'path' },
	{ name = 'buffer' }
})
-- If a file is too large, I don't want to add to it's cmp sources treesitter, see:
-- https://github.com/hrsh7th/nvim-cmp/issues/1522
autocmd('BufReadPre', {
	callback = function(t)
		local sources = default_cmp_sources
		if not BufIsBig(t.buf) then
			sources[#sources+1] = {name = 'treesitter', group_index = 2}
		end
	cmp.setup.buffer {
		sources = sources
	}
	end
})
