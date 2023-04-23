return {
  "neovim/nvim-lspconfig",
  dependencies = "williamboman/mason.nvim",
  config = function()
    --vim.lsp.set_log_level("debug")

    local lspconfig = require ("lspconfig")
    local protocol = require('vim.lsp.protocol')

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

      --Enable completion triggered by <c-x><c-o>
      --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap = true, silent = true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end

    -- Set up completion using nvim_cmp with LSP source
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- LSP configuration for Ansible
    lspconfig["ansiblels"].setup({
      filetypes = {
        "yaml",
      },
      settings = {
        ansible = {
          ansible = {
            path = "ansible",
            useFullyQualifiedCollectionNames = true
          },
          ansibleLint = {
            enabled = true,
            path = "ansible-lint"
          },
          executionEnvironment = {
            enabled = false
          },
          python = {
            interpreterPath = "python"
          },
          completion = {
            provideRedirectModules = true,
            provideModuleOptionAliases = true
          }
        },
      },
      on_attach = on_attach,
      capabilities = capabilities
    })

    -- LSP configurations for Bash
    lspconfig["bashls"].setup({ on_attach = on_attach, capabilities = capabilities })

    -- LSP configurations for Dockerfile
    lspconfig["dockerls"].setup({ on_attach = on_attach, capabilities = capabilities })

    --LSP configuration for JSON
    lspconfig["jsonls"].setup({ on_attach = on_attach, capabilities = capabilities })

    -- LSP configuration for Markdown
    lspconfig["marksman"].setup({ on_attach = on_attach, capabilities = capabilities })

    -- LSP configurations for Python
    lspconfig["pyright"].setup({
      on_attach = on_attach,
      capabilities = capabilities
    })

    -- LSP configurations for Lua
    lspconfig["lua_ls"].setup({
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
      end,
      capabilities = capabilities,
      settings = {
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
      },
    })
    -- LSP configuration for Terraform
    lspconfig["terraformls"].setup({ on_attach = on_attach, capabilities = capabilities })

    -- LSP configuration for YAML
    lspconfig["yamlls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        yaml = { keyOrdering = false },
      },
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
  end
}
