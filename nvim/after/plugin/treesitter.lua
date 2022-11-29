local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  autotag = {
    enable = true,
  },
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  -- ensure these language parsers are installed
  ensure_installed = {
    "fish",
    "vim",
    "jq",
    "yaml",
    "html",
    "css",
    "markdown",
    "bash",
    "lua",
    "python",
    "dockerfile",
  },
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
})
