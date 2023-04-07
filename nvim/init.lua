-- Install Lazy package manager

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', --latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Remap space as leader key
-- Must be before lazy
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

require("lazy").setup("plugins", {
ui = {
  border = "rounded", -- Enable rounded borders for the "lazy.nvim" UI.
},
performance = {
  rtp = {
    disabled_plugins = { -- Disable certain in-built plugins which are useful af.
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
    },
  },
},
})

-- Vim autocommands/autogroups
require("autocmd")
-- "Global" Keymappings
require("maps")
-- All non plugin related (vim) options
require("options")

