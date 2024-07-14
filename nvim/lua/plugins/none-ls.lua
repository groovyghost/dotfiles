--Formatter and Linters
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim", --Server installer for mason
  },
  config = function()
    local servers = {
      "ansible-lint",
      "black",
      "stylua",
      "shellcheck",
      "shfmt",
      "tflint",
      "isort",
    }
    local mason_installer = require("mason-tool-installer")
    mason_installer.setup({
      ensure_installed = servers,
    })
    local nls = require("null-ls")
    nls.setup({
      sources = {
        --Diagnostics
        --Code_actions
        -- nls.builtins.code_actions.shellcheck,
        --Formatting
        nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.terraform_fmt,
        nls.builtins.formatting.black,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = vim.api.nvim_create_augroup("LspFormatting", {}), buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", {}),

            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
