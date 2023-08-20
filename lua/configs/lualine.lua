-- Color table for highlights
-- stylua: ignore
local colors = require('tokyonight.colors')
--local colors = {
--	bg       = '#202328',
--	fg       = '#bbc2cf',
--	yellow   = '#ECBE7B',
--	cyan     = '#008080',
--	darkblue = '#081633',
--	green    = '#98be65',
--	orange   = '#FF8800',
--	violet   = '#a9a1e1',
--	magenta  = '#c678dd',
--	blue     = '#51afef',
--	red      = '#ec5f67',
--}
local config = {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {'alpha'},
      winbar = {'alpha'},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {''},
    lualine_x = {'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree','fzf','nvim-dap-ui','trouble'}
}
local function ins_left(component)
	table.insert(config.sections.lualine_c,component)
end
local function ins_right(component)
	table.insert(config.sections.lualine_x,component)
end
ins_left{
	'diagnostics',
 	sources = { 'nvim_diagnostic' },
 	symbols = { error = ' ', warn = ' ', info = ' ' },
 	diagnostics_color = {
	 	color_error = { fg = colors.red },
	 	color_warn = { fg = colors.yellow },
	 	color_info = { fg = colors.cyan },
	 },
}
ins_right {
	--lsp server name
	function()
 		local msg = 'No Active Lsp'
 		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
 		local clients = vim.lsp.get_active_clients()
 		if next(clients) == nil then
 		  return msg
 		end
 		for _, client in ipairs(clients) do
 		  local filetypes = client.config.filetypes
 		  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
 		    return client.name
 		  end
 		end
 	return msg
 	end,
 	icon = ' LSP:',
 	color = { gui = 'bold', bg = colors.bg, fg = colors.fg},
}
require("lualine").setup(config)
