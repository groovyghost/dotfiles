return {
    Lua = {
      format = { enable = false },                         -- Disable the LSP-based formatting
      diagnostics = {
        globals = { "vim" } },                             -- Disable Lua diagnostics since it interferes with Selene
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Load the Neovim runtime files for usage during Neovim configuration
        checkThirdParty = false
      },                                                   -- Disable checking for 3rd-party libraries
      telemetry = { enable = false },
    },
}
