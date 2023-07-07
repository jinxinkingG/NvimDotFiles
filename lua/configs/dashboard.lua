return{

	theme = 'hyper', --  theme is doom and hyper default is hyper
	disable_move=false,   --  default is false disable move keymap for hyper
	shortcut_type='letter',   --  shorcut type 'letter' or 'number'
	change_to_vcs_root=false,-- default is false,for open file in hyper mru. it will change to the root of vcs
	config = {
   		header = {
		  '												  ',
		  '												  ',
   		  '███████╗██╗      █████╗ ███████╗██╗  ██╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
   		  '██╔════╝██║     ██╔══██╗██╔════╝██║  ██║    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
   		  '█████╗  ██║     ███████║███████╗███████║    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
   		  '██╔══╝  ██║     ██╔══██║╚════██║██╔══██║    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
   		  '██║     ███████╗██║  ██║███████║██║  ██║    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
   		  '╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
		  '												  ',
   		}, --your header
		-- week_header={
		-- 	enable = true
		-- },
		shortcut = {
			{desc=' Plugins Update', group ='@property',key = 'u',action ='Lazy update'},
			{desc=' Create New File', group ='@property',key = 'e',action ='e Untitle'},
			{desc='🔭 Find Files', group ='@property',key = 'f',action ='Telescope find_files'},
			{desc='  Quit', group ='@property',key = 'q',action ='q!'},
		},
		packages = { enable = true },
		project = { enable = false },
		mru = { limit = 10},
		footer = {
			'						',
			'🚀 Sharp tools make good work.	JinJin♥️ JoJo @2023'
		}
	},    --  config used for theme
	hide = {
	  statusline=true,    -- hide statusline default is true
	  tabline=false,       -- hide the tabline
	  winbar=false        -- hide winbar
	},
	--preview = {
	--  command       -- preview command
	--  file_path     -- preview file path
	--  file_height   -- preview file height
	--  file_width    -- preview file width
	--}
}
-- DOOM theme
--	return {
--	  theme = 'doom',
--	  config = {
--	    header = {
--		'███████╗██╗      █████╗ ███████╗██╗  ██╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
--		'██╔════╝██║     ██╔══██╗██╔════╝██║  ██║    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
--		'█████╗  ██║     ███████║███████╗███████║    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
--		'██╔══╝  ██║     ██╔══██║╚════██║██╔══██║    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
--		'██║     ███████╗██║  ██║███████║██║  ██║    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
--		'╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ '
--	    }, --your header
--	    center = {
--	      {
--	        icon = ' ',
--	        icon_hl = 'Title',
--	        desc = 'Find File           ',
--	        desc_hl = 'String',
--	        key = 'b',
--	        keymap = 'SPC f f',
--	        key_hl = 'Number',
--	        action = 'lua print(2)'
--	      },
--	      {
--	        icon = ' ',
--	        desc = 'Find Dotfiles',
--	        key = 'f',
--	        keymap = 'SPC f d',
--	        action = 'lua print(3)'
--	      },
--	    },
--	    footer = {}  --your footer
--	  }
--	}

