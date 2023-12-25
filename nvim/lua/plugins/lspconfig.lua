-- LSP configuration setup
return {
  "neovim/nvim-lspconfig", -- Use neovim's built-in LSP client

  dependencies = {
    "williamboman/mason.nvim",           -- LSP server manager
    "williamboman/mason-lspconfig.nvim", -- Bridge between lspconfig and mason
    {
      "j-hui/fidget.nvim",
      tag = "v1.0.0",
      opts =
      {
        notification =
        { override_vim_notify = true }
      }
    },                                                                              -- LSP status indicator
    "folke/neodev.nvim",                                                            -- Neovim development environment
    { "nvimdev/lspsaga.nvim", commit = "5f85df47cf51c7ffb4eccb2a0c21f70a96fc6d5a" } -- Extension for neovim LSP features
  },

  config = function()
    -- Configure diagnostic display settings
    -- error lens
    vim.fn.sign_define {
      {
        name = 'DiagnosticSignError',
        text = '',
        texthl = 'DiagnosticSignError',
        linehl = 'ErrorLine',
      },
      {
        name = 'DiagnosticSignWarn',
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'WarningLine',
      },
      {
        name = 'DiagnosticSignInfo',
        text = '',
        texthl = 'DiagnosticSignInfo',
        linehl = 'InfoLine',
      },
      {
        name = 'DiagnosticSignHint',
        text = '',
        texthl = 'DiagnosticSignHint',
        linehl = 'HintLine',
      },
    }
    vim.diagnostic.config({
      virtual_text = {
        prefix = '●'
      },
      update_in_insert = true,
      float = {
        source = "always", -- Always show diagnostic information
      },
    })

    -- Setup lspsaga extension
    require('lspsaga').setup {
      lightbulb = {
        enable = false, -- Disable the lightbulb icon for code actions
      },
      rename = {
        keys = {
          quit = 'q', -- Set 'q' to quit rename mode
        },
      },
      outline = {
        win_width = 30,
        auto_preview = false,
        detail = false,
        close_after_jump = true,
      },
      diagnostic = {
        show_code_action = false, }
    }
    -- Keymaps
    vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", { desc = "Go to previous diagnostic message" })
    vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", { desc = "Go to next diagnostic message" })
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics in [Q]uickfix list" })
    vim.keymap.set("n", "<leader>o", ":Lspsaga outline<CR>", { desc = "Open Symbols [O]utline" })
    -- Define the on_attach function to be executed when attaching LSP to a buffer
    local on_attach = function(_, bufnr)
      -- Helper function for creating buffer-scope LSP keymaps with descriptions
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      -- Define key mappings for common LSP actions
      nmap("<leader>rn", ":Lspsaga rename<CR>", "[R]e[n]ame")
      nmap("<leader>ca", ":Lspsaga code_action<CR>", "[C]ode [A]ction")
      nmap("<leader>h", ":Lspsaga hover_doc<CR>", "[H]over Documentation")
      nmap("gd", ":Lspsaga goto_definition<CR>", "[G]oto [d]efinition")
      nmap("go", ":Lspsaga goto_type_definition<CR>", "[G]oto Type [D]efinition")
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
      nmap('gp', ':Lspsaga peek_definition<CR>', "[P]eek definition")
    end

    -- Set up Mason for managing LSP servers
    require("mason").setup()

    -- Define LSP servers and their configurations
    local servers = {
      bashls = {},
      pylsp = {
        pylsp = {
          plugins = {
            -- formatter options
            autopep8 = { enabled = true },
            -- linter options
            pyflakes = { enabled = true },
            -- type checker
            pylsp_mypy = { enabled = false },
            -- auto-completion options
            jedi_completion = { fuzzy = true },
            -- import sorting
            rope_autoimport = { enabled = true },
            pyls_isort = { enabled = true },
          },
        },
      },
      lua_ls = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- Get nvim-cmp capabilities for LSP
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Install Mason servers based on the defined server configurations
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    -- Set up Mason-LSPConfig handler for configuring LSP servers
    mason_lspconfig.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }
  end
}
