-- Set lualine as statusline
return {
	'nvim-lualine/lualine.nvim',
	opts = {
		options = {
			theme = "catppuccin",
			section_separators = "",
			component_separators = "|",
			disabled_filetypes = { "NeoTree" },
		},
		sections = {
		lualine_a = { "mode" },
			lualine_b = { { "branch", icon = "" }, "diff" },
			lualine_c = {
				{
					"filename",
					file_status = true, -- displays file status (readonly status, modified status)
					path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
				},
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
				},
				"encoding",
				"filetype",
				"fileformat",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { {
				"filename",
				file_status = true,
				path = 1,
			} },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
	extensions = {},
	},
}