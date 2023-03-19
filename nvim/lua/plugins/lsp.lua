return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- LSP Support
    {'williamboman/mason.nvim'},           -- Mason LSP manager
    {'williamboman/mason-lspconfig.nvim'}, -- Mason - LSP Config

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  },
  config = function()
    require("plugins.lsp.lsp")
  end,
}
