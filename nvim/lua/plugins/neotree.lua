return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree reveal toggle<cr>", desc = "Toggle Filetree" },
	},
	opts = {
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		popup_border_style = "rounded", -- "double", "none", "rounded", "shadow", "single" or "solid"
		enable_git_status = true,
		enable_diagnostics = true,
		sort_case_insensitive = true,
		window = {
			position = "left",
			width = 40,
			mapping_options = { noremap = true, nowait = true,},
			mappings = {
				["o"] = "open",
				["<Tab>"] = { "toggle_preview", config = { use_float = true } },
				["a"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = { "copy", config = { show_path = "absolute" }}, --"none", "relative", "absolute"
				["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
				["q"] = "close_window",
				["r"] = "refresh",
				["?"] = "show_help",
				["f"] = "fuzzy_sorter",
			},
		},
	},
}
