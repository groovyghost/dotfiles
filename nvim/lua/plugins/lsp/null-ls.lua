local settings = require("settings")
require("mason").setup()
require("mason-null-ls").setup({
    ensure_installed =  settings.tools,
    automatic_installation = false,
    automatic_setup = true, -- Recommended, but optional
})
require("null-ls").setup()

require 'mason-null-ls'.setup_handlers() -- If `automatic_setup` is true.
