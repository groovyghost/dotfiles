return {
  "glepnir/lspsaga.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      diagnostic = {
        on_insert = true,
        on_insert_follow = false,
        insert_winblend = 0,
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        max_width = 0.7,
        max_height = 0.6,
        max_show_width = 0.9,
        max_show_height = 0.6,
        text_hl_follow = true,
        border_follow = true,
        extend_relatedInformation = false,
        keys = {
          exec_action = 'o',
          quit = 'q',
          expand_or_jump = '<CR>',
          quit_in_show = { 'q', '<ESC>' },
        },
      },
      ui = {
        winblend = 10,
        border = 'rounded',
        colors = {
          normal_bg = '#002b36'
        }
      }
    })

    local diagnostic = require("lspsaga.diagnostic")
    local opts = { noremap = true, silent = true }
    -- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_diagnostic<CR>', opts)
    vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
    -- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
    vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
    vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

    -- code action
    local codeaction = require("lspsaga.codeaction")
    vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
    vim.keymap.set("v", "<leader>ca", function()
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
      codeaction:range_code_action()
    end, { silent = true })

  end,
}
