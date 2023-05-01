return {
  'hrsh7th/nvim-cmp',
  dependencies =  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim'},
  event = "InsertEnter",
  config = function()
    local cmp = require ("cmp")
    local luasnip =require ("luasnip")
    local lspkind = require("lspkind")
    require("luasnip/loaders/from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/snipmate" }
    luasnip.setup({
      region_check_events = "InsertEnter",
      delete_check_events = "InsertEnter",
    })
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-n>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, {
            "i",
            "s",
          }),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
            "i",
            "s",
          }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol", -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        }),
      },
      window = {
        completion = cmp.config.window.bordered {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:CmpCursorLine,Search:Search",
          col_offset = -3,
          side_padding = 1,
          scrollbar = false
        },
        documentation = cmp.config.window.bordered {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:CmpDocumentationBorder,CursorLine:CmpCursorLine,Search:Search",
          col_offset = -3,
          scrollbar = false,
          side_padding = 1
        }
      }
    })
    vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
    -- Disable certain capabilities when working on Markdown files.
    cmp.setup.filetype({ "markdown" }, { sources = { name = "buffer" } })
  end
}
