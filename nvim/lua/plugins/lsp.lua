return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      {
        'j-hui/fidget.nvim',
        tag = "legacy",
        event = "LspAttach",
        opts = { window = { blend = 0 } }
      },
      'folke/neodev.nvim'
    },
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
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("plugins.lsp.null-ls")
    end,
  }
}
