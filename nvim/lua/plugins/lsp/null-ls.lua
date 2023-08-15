local null_ls = require("null-ls")
require("mason-null-ls").setup({
  automatic_installation = false,
  ensure_installed = {
    "shellcheck",
    "shfmt",
    "tflint",
    "black",
    "jq"
  }
})

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.shfmt,
  },
})
