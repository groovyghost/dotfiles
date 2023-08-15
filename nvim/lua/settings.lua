local M = {}
-- Disable certain in-built plugins which are useful af.
M.plugins_disabled = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

M.treesitter_installed = {
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
  "vim",
  "yaml",
}

M.tools_installed = {
  -- Formatter
  "black",
  "stylua",
  "shfmt",
  -- Linter
  "shellcheck",
  "tflint",
  "yamllint",
}

return M
