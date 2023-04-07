return {
  {
    "echasnovski/mini.trailspace", -- Plugin to visualise trailing whitespaces
    event = "InsertLeave",
    config = function()
      require("mini.trailspace").setup()
    end,
  },

  {
    "echasnovski/mini.comment", -- Plugin for easier commenting across source code
    event = "VeryLazy", -- Not sure what this event is about but it works any way!
    opts = {
      hooks = {
        pre = function()
          -- Necessary hook for commenting source code based on Treesitter queries.
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
  {
    "echasnovski/mini.pairs", -- Plugin for automatically inserting bracket pairs
    event = "InsertEnter",
    opts = {
      modes = {
        insert = true, -- Enable insert bracket pairs automatically in Insert mode
        command = true, -- Enable bracket pair insertion in Command mode
        terminal = true, -- Enable bracket pair insertion in Terminal mode
      },
    },
    config = function(opts)
      require("mini.pairs").setup(opts)
    end,
  },
}
