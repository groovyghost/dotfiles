return {
  "neovim/nvim-lspconfig", -- Neovim's built-in LSP client
  dependencies = {
    { "williamboman/mason.nvim", opts = true }, --LSP servers manager
    { "williamboman/mason-lspconfig.nvim", opts = true }, -- Bridge between lspconfig and mason
    { "simrat39/symbols-outline.nvim", opts = true }, -- For Documentation symbols outline
    { "utilyre/barbecue.nvim", opts = true, version = "*", dependencies = "SmiteshP/nvim-navic" },
    {
      "j-hui/fidget.nvim", -- LSP status indicator and notifier
      tag = "v1.0.0",
      opts = {
        notification = { override_vim_notify = true },
      },
    },
    { "folke/neodev.nvim" },
  },
  config = function()
    local icons = require("utils.icons")

    --keymaps
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

    local on_attach = function(_, bufnr)
      -- A function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      -- Frequently used keymaps
      nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("K", vim.lsp.buf.hover, "[H]over Documentation")
      nmap("<leader>o", ":SymbolsOutline<CR>", "Symbols[O]utine")
      -- Navigation
      nmap("<leader>d", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

      -- Lesser used features
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    end
    --Config lsp to nvim_cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    }
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    --Diagnostics
    vim.diagnostic.config({
      signs = {
        active = true,
        values = {
          { name = "DiagnosticSignError", text = icons.diagnostics.Error },
          { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
          { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
          { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
        },
      },
      virtual_text = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    require("lspconfig.ui.windows").default_options.border = "rounded"

    local servers = {
      ansiblels = {
        ansible = {
          -- executionEnvironment = {
          --   enabled = true,
          -- },
          validation = {
            enabled = true,
          },
          completion = {
            provideRedirectModules = true,
            provideModuleOptionAliases = true,
          },
          python = {
            interpreterPath = "python3",
          },
        },
      },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            globals = { "vim" },
            disable = { "missing-fields" },
          },
        },
      },
      bashls = {},
      cssls = {},
      dockerls = {},
      terraformls = {},
      html = {},
      tsserver = {},
      pyright = {},
      jsonls = {},
      yamlls = {},
      marksman = {},
      tailwindcss = {},
    }
    -- Ensure the servers above are installed
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end,
    })
  end,
}
