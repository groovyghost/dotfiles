local M = {}

-- Toggle global status line
M.global_statusline = true
-- set numbered lines
M.number = true
-- enable mouse see :h mouse
M.mouse = "nv"
-- set relative numbered lines
M.relative_number = true
-- always show tabs; 0 never, 1 only if at least two tab pages, 2 always
M.showtabline = 1
-- enable or disable listchars
M.list = false
-- which list chars to schow
M.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<"
-- Noice heavily changes the Neovim UI ...
M.enable_noice = true
-- treesitter parsers to be installed
-- one of "all", "maintained" (parsers with maintainers), or a list of languages
M.treesitter_ensure_installed = {
  "bash",
  "cmake",
  "css",
  "dockerfile",
  "go",
  "hcl",
  "html",
  "java",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "query",
  "python",
  "regex",
  "terraform",
  "toml",
  "vim",
  "yaml",
}

-- LSPs that should be installed by Mason-lspconfig
M.lsp_servers = {
  "ansiblels",
  "bashls",
  "dockerls",
  "jsonls",
  "marksman",
  "pyright",
  "lua_ls",
  "terraformls",
  "yamlls",
}

-- Tools that should be installed by Mason
M.tools = {
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
