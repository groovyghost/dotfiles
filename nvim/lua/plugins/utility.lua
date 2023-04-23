return {
  { --plugin that auto pairs & closes brackets
    "m4xshen/autoclose.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        disabled_filetypes = { "text", "markdown" },
        disable_when_touch = true,
      },
    },
  },
  { --Smart surrounds
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
    -- ys{motion}{char} Add
    -- ds{motion}{char} Delete
    -- cs{target}{replacement} Change
  },
  { --Commenting for Nvim
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  { --Indent guides for Neovim
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    },
  }
}
