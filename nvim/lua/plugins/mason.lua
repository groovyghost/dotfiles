return {
  "williamboman/mason.nvim", -- A friendly plugin for managing the LSP servers more easily.
  build = ":MasonUpdate",
  cmd = "Mason", -- Lazy-load the plugin only when this command is invoked.
  dependencies = "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason").setup({
      ui = { border = "rounded" }, -- Enable a nice-looking UI for the Mason floating window
      log_level = vim.log.levels.INFO, -- Enable DEBUG mode when LSP things needs a bit of debugging
    })
    require("mason-lspconfig").setup({
      ensure_installed = require("settings").lsp_servers,
      automatic_installation = true,
    })
  end,
}
