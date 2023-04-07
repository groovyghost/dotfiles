return {
  "nvim-treesitter/nvim-treesitter",
  build = function() -- Command to invoke after installing the plugin.
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  event = { "BufReadPost", "BufNewFile" }, -- Lazy-load the plugin only on certain events
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring", -- Plugin for better commenting on JSX/TSX files.
    "nvim-treesitter/nvim-treesitter-textobjects", -- Navigate around code blocks more easily with this extension.
    "RRethy/nvim-treesitter-endwise",
    "windwp/nvim-ts-autotag", -- Extension for automatic HTML tag completion.
  },
  opts = {
    ensure_installed = require("settings").treesitter_ensure_installed , -- Ensure the parsers for these languages are compulsarily installed
    highlight = { enable = true }, -- Enable syntax highlighting using the Treesitter parsers
    indent = { enable = true }, -- Enable Treesitter-based indentation
    context_commentstring = {
      enable = true,
      enable_autocmd = false }, -- Enable easier commenting using Treesitter
    incremental_selection = { enable = true },-- Incrementally select content powered by Treesitter
    autotag = { enable = true }, -- Enable adding automatic HTML/JSX closing tags based on Treesitter queries
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts) -- Load the plugin with the config values mentioned above
  end,
}
