return {
  "neovim/nvim-lspconfig",
  dependencies = "williamboman/mason.nvim",
  config = function()
    local lspconfig = require("lspconfig")
    vim.opt.updatetime = 250 -- Make Neovim to display the diagnostic hover window as fast as possible.
    vim.lsp.set_log_level("error")
    vim.diagnostic.config({
      virtual_text = true, -- Disable the inline diagnostic message
      underline = true, -- Show diagnostic errors with a squigly underline
      signs = true, -- Disable the diagnostic signs in the number column to keep the UI clean
      update_in_insert = false, -- Update the diagnostic message even when in Insert mode
      severity_sort = true, -- Configure Neovim to sort the error messages according to the severity.
    })
    require("lspconfig.ui.windows").default_options.border = "rounded" --Add rounded borders to LSP floating windows

    local on_attach = function(_, bufnr)
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      map("n", "gD", vim.lsp.buf.declaration, opts)
      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "gi", vim.lsp.buf.implementation, opts)
      map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      map("n", "<Leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folder))
      end, opts)
      map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
    end
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
        on_attach = on_attach, capabilities = capabilities })

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
      before_init = function(_, config)
        if lsp == "pyright" then
          config.settings.python.pythonPath = utils.get_python_path(config.root_dir)
        end
      end,
      on_attach = on_attach,
      capabilities = capabilities })

    -- LSP configurations for Lua
    lspconfig["lua_ls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          format = { enable = false }, -- Disable the LSP-based formatting
          runtime = { version = "LuaJIT" },
          diagnostics = {
            globals = { "vim" },
            enable = false }, -- Disable Lua diagnostics since it interferes with Selene
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true), -- Load the Neovim runtime files for usage during Neovim configuration
            checkThirdParty = false }, -- Disable checking for 3rd-party libraries
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

  end
}
