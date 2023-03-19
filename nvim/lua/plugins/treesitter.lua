return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"RRethy/nvim-treesitter-endwise",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local settings = require("settings")
		require("nvim-treesitter.configs").setup({
			ensure_installed = settings.treesitter_ensure_installed,
			ignore_install = {}, -- List of parsers to ignore installing
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = {}, -- list of language that will be disabled
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					scope_incremental = "<CR>",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
			endwise = {
				enable = true,
			},
			indent = { enable = true },
			autopairs = { enable = true },
		})

		require("nvim-ts-autotag").setup()
	end,
}
