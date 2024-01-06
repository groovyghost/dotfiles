-- Define the path for the lazy.nvim plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is not already installed, then clone it from the repository
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Prepend the path to lazy.nvim to the runtime path
vim.opt.rtp:prepend(lazypath)

-- Load and setup the lazy.nvim plugin with specified configurations
require("lazy").setup({
  { import = "plugins" }, -- Import plugin configurations from the 'plugins' module

  -- Colors
  {
    "folke/tokyonight.nvim", -- Colorscheme
    config = function()
      require("tokyonight").setup({
        style = "night",
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        theme = "tokyonight",
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  -- Git information
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set(
          "n",
          "<leader>gd",
          require("gitsigns").diffthis,
          { buffer = bufnr, desc = "[G]it [D]iff current buffer" }
        )
        vim.keymap.set(
          "n",
          "<leader>gd",
          require("gitsigns").diffthis,
          { buffer = bufnr, desc = "[G]it [D]iff current buffer" }
        )
      end,
    },
  },

  -- Surround
  {
    "tpope/vim-surround",
    event = "BufEnter",
    -- ys{motion}{char} Add
    -- ds{motion}{char} Delete
    -- cs{target}{replacement} Change
  },

  -- Autopair
  {
    "windwp/nvim-autopairs",
    opts = {},
  },

  -- Commenting for Nvim
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Keybinding guide
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
      require("which-key").register({
        ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
        ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
        ["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
      })
    end,
  },
  {
    "numToStr/Navigator.nvim",
    cmd = {
      "NavigatorLeft",
      "NavigatorRight",
      "NavigatorUp",
      "NavigatorDown",
      "NavigatorPrevious",
    },
    keys = {
      { "<A-h>", "<CMD>NavigatorLeft<CR>" },
      { "<A-l>", "<CMD>NavigatorRight<CR>" },
      { "<A-k>", "<CMD>NavigatorUp<CR>" },
      { "<A-j>", "<CMD>NavigatorDown<CR>" },
      { "<A-p>", "<CMD>NavigatorPrevious<CR>" },
    },
    config = function()
      require("Navigator").setup()
    end,
  },
})
