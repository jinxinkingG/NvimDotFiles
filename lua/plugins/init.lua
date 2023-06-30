-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use {
  		'phaazon/hop.nvim',
 		branch = 'v2', -- optional but strongly recommended
  		config = function()
    		-- you can configure Hop the way you like here; see :h hop-config
    		require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
 		 end
	}
	use {
  		"folke/which-key.nvim",
  		config = function()
    		vim.o.timeout = true
    		vim.o.timeoutlen = 300
   		 require("which-key").setup {
			 require("configs.whichkey")
    	}
	
  end
}


end)
