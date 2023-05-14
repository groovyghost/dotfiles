return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "plugins.lsp.lspconfig"
    end
  },
  {
    "glepnir/lspsaga.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "LspAttach",
    config = function()
      require "plugins.lsp.lspsaga"
    end,
  },
  {
    "williamboman/mason.nvim", -- A friendly plugin for managing the LSP servers more easily.
    build = ":MasonUpdate",
    cmd = "Mason",
    dependencies = "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup({
        PATH = "append",
        ui = { border = "rounded" },
        log_level = vim.log.levels.INFO, -- Enable DEBUG mode when LSP things needs a bit of debugging
      })
      require("mason-lspconfig").setup({
        ensure_installed = require("settings").lsp_servers,
        automatic_installation = true,
      })
    end,
  }
}
