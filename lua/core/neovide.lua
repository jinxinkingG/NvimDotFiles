if vim.g.neovide then
	vim.g.neovide_fullscreen = false
	vim.g.neovide_remember_window_size = true
	-- Hiding the mouse when typing
	vim.g.neovide_hide_mouse_when_typing = true
	-- Underline automatic scaling
	vim.g.neovide_underline_automatic_scaling = true
	-- Theme
	vim.g.neovdie_theme = 'auto'
	-- Refresh Rate
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5
	-- Cursor animation length
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.4
	-- Scroll Animation Length
	vim.g.neovide_scroll_animation_length = 0.3
	-- Cursor particle opacity
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_cursor_vfx_opacity = 80.0
	-- Particle config
	vim.g.neovide_cursor_vfx_particle_lifetime = 0.6
end
