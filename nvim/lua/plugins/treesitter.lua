return {
  "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring", -- Plugin for better commenting on JSX/TSX files.
    "nvim-treesitter/nvim-treesitter-textobjects", -- Navigate around code blocks more easily with this extension.
    "RRethy/nvim-treesitter-endwise",
    "windwp/nvim-ts-autotag", -- Extension for automatic HTML tag completion.
  },
  opts = {
    ensure_installed = require("settings").treesitter_installed,
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = {
      enable = true,
      enable_autocmd = false },
    incremental_selection = { enable = true },
    autotag = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
