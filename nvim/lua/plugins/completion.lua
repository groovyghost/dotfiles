-- Auto-completion setup using nvim-cmp
return {
  "hrsh7th/nvim-cmp", -- Use nvim-cmp for completion

  dependencies = {
    "L3MON4D3/LuaSnip",             -- VS Code style snippet engine
    "saadparwaiz1/cmp_luasnip",     -- Provide Luasnip as one of nvim-cmp sources
    "hrsh7th/cmp-nvim-lsp",         -- nvim-cmp source for LSP engine
    "hrsh7th/cmp-buffer",           -- nvim-cmp source for buffer words
    "hrsh7th/cmp-path",             -- nvim-cmp source for file path
    "rafamadriz/friendly-snippets", -- Snippet collections
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Completion icons for different kinds of items
    local kind_icons = {
      Text = "",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰇽",
      Variable = "󰂡",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰅲",
    }

    -- Lazy load Luasnip from VSCode snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup({})

    -- Configure nvim-cmp
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- Show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- Close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP as a source
        { name = "luasnip" },  -- Luasnip as a source
      }, {
        { name = "buffer" },   -- Buffer words as a source
        { name = "path" },     -- File path as a source
      }),

      -- UI customization
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      -- Completion formatting
      formatting = {
        format = function(entry, vim_item)
          -- Append kind icons
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

          -- Source
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]

          return vim_item
        end,
      },
    })
  end,
}
