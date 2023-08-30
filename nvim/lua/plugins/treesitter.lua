return {
  "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "go",
      "hcl",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "terraform",
      "yaml",
    },
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = {
      enable = true,
      enable_autocmd = false
    },
    incremental_selection = { enable = true },
    autotag = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
