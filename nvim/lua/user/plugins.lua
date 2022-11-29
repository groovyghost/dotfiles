-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
pcall(require, "impatient")

packer.init({
  profile = {
    enable = true,
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
  compile_path = vim.fn.stdpath("data") .. "/site/pack/loader/start/packer.nvim/plugin/packer.lua",
  git = {
    depth = 1,
  },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- List of plugins
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
  -- Color schemes
  use("shaunsingh/nord.nvim")
  use("sainnhe/gruvbox-material") --Gruvbox-materal theme

  -- File explorer
  use("nvim-tree/nvim-tree.lua")
  -- Indent line
  use("lukas-reineke/indent-blankline.nvim")
  -- Autopair

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  use("akinsho/nvim-bufferline.lua")

  -- Icons
  use("kyazdani42/nvim-web-devicons")

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({})
    end,
  })

  -- Dashboard (start screen)
  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  --Performance
  use("lewis6991/impatient.nvim")

  --AutoCompletion
  use("onsails/lspkind.nvim")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lsp")
  --Snippets
  use("L3MON4D3/LuaSnip")

  -- Treesitter
  use({ "windwp/nvim-ts-autotag", opt = true })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
  })

  use({
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  })

  use("RRethy/vim-illuminate")

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({ theme = "gruvbox-material" })
    end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
