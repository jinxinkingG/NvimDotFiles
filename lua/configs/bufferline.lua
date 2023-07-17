require("bufferline").setup{
	options={
   		 offsets = {
        		{
        		    filetype = "NvimTree",
        		    text = "File Explorer",
        		    highlight = "Directory",
        		    separator = true -- use a "true" to enable the default, or set your own character
        		}
		},
		diagnostics = "nvim-lsp",
		show_buffer_close_icons = false
    	}
}
