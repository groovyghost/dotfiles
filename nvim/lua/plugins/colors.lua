return {
  {
    "catppuccin/nvim", -- Colorscheme
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
      },
    },
  }
}
