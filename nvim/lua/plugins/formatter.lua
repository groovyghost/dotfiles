return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  keys = {
    { "<leader>F", function() require("conform").format({ lsp_fallback = true }) end, desc = "LSP: Format current buffer" },
  },
  opts = {
    format_on_save = {
      lsp_fallback = true,
    },
    format_after_save = {
      lsp_fallback = true,
    },
  },
}
