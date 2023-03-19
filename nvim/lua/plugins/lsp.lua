return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- LSP Support
    {'williamboman/mason.nvim'},           -- Mason LSP manager
    {'williamboman/mason-lspconfig.nvim'}, -- Mason - LSP Config
  },
  config = function()
    require("plugins.lsp.lsp")
  end,
}
