-- Adds git releated signs to the gutter, as well as utilities for managing changes
return  {
	'lewis6991/gitsigns.nvim',
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
		},
	},
}
