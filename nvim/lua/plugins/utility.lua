return {
  { "folke/which-key.nvim", opts = {}},
  { "m4xshen/autoclose.nvim", --plugin that auto pairs & closes brackets
    event = "VeryLazy",
    opts = {
      options = {
        disabled_filetypes = { "text", "markdown" },
        disable_when_touch = true,
      },
    },
  },
  { "kylechui/nvim-surround", --Smart surrounds
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
    -- ys{motion}{char} Add
    -- ds{motion}{char} Delete
    -- cs{target}{replacement} Change
  },
  { "numToStr/Comment.nvim", --Commenting for Nvim
    config = function()
      require("Comment").setup()
    end
  },
  { "lukas-reineke/indent-blankline.nvim", --Indent guides for Neovim
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    },
  },
  { "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup({})
    end
  }
}
