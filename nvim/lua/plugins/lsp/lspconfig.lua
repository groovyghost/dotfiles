local lspconfig = require ("lspconfig")

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP configuration for Ansible
lspconfig["ansiblels"].setup({
  require("plugins.lsp.settings.ansiblels"),
  on_attach = on_attach,
  capabilities = capabilities
})

-- LSP configurations for Lua
lspconfig["lua_ls"].setup({
  require("plugins.lsp.settings.lua_ls"),
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  capabilities = capabilities,
})

-- LSP configuration for YAML
lspconfig["yamlls"].setup({
  require("plugins.lsp.settings.yamlls"),
  on_attach = on_attach,
  capabilities = capabilities,
})

-- LSP configurations for Bash
lspconfig["bashls"].setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- LSP configurations for Dockerfile
lspconfig["dockerls"].setup({
  on_attach = on_attach,
  capabilities = capabilities
})

--LSP configuration for JSON
lspconfig["jsonls"].setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- LSP configuration for Markdown
lspconfig["marksman"].setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- LSP configurations for Python
lspconfig["pyright"].setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- LSP configuration for Terraform
lspconfig["terraformls"].setup({
  on_attach = on_attach,
  capabilities = capabilities
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  }
)
-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
local hl = "DiagnosticSign" .. type
vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
float = {
  source = "always", -- Or "if_many"
  },
})