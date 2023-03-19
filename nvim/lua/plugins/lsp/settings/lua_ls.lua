return {
  cmd = { "lua-language-server" },
  format = {
    enable = false, -- let null-ls handle the formatting
  },
  filetypes = { "lua" },
  runtime = {
    version = "LuaJIT",
    path = vim.split(package.path, ";"),
  },
  completion = { enable = true, callSnippet = "Replace" },
  diagnostics = {
    -- enable = true,
    -- globals = { "vim", "describe" },
    globals = {
      "vim",
      "nnoremap",
      "vnoremap",
      "inoremap",
      "tnoremap",
      "use",
    },
  },
  telemetry = { enable = false },
}
