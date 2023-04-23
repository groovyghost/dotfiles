return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        section_separators = "",
        component_separators = "|",
        globalstatus = true,
        disabled_filetypes = { -- Disable the statusline for certain filetypes mentioned below
          statusline = {
            "filesytem",
            "neo-tree",
            "dashboard",
            "lazy",
            "alpha",
            "null-ls-info",
            "lspinfo",
            "mason",
            "neo-tree-popup",
          },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { { "branch", icon = "" },
                    { 'diff', symbols = {
              added = ' ', modified = ' ', removed = ' ' } } },
        lualine_c = { { "filename", file_status = true, path = 0 },},
        lualine_x = { { "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " }, },
          "encoding",
          "filetype",
          "fileformat",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
