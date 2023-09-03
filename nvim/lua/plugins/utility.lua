return {
  { 'lewis6991/gitsigns.nvim', opts = {} },
  { "folke/which-key.nvim",    opts = {} },
  {
    "tpope/vim-surround",
    event = "BufEnter",
    -- ys{motion}{char} Add
    -- ds{motion}{char} Delete
    -- cs{target}{replacement} Change
  },
  {
    "numToStr/Comment.nvim", --Commenting for Nvim
    event = "BufEnter",
    config = function()
      require("Comment").setup()
    end
  },
  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup({})
    end
  },
  {
    'ThePrimeagen/harpoon',
    event = "BufEnter",
    config = function()
      require("harpoon").setup({
      })
    end
  }
}
