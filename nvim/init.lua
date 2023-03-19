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
  -- defaults = { lazy = true },
  install = {
    missing = true, -- install missing plugins on startup. This doesn't increase startup time.
  },
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = true, -- get a notification when changes are found
  },
  debug = false,
})

-- Vim autocommands/autogroups
require("autocmd")
-- "Global" Keymappings
require("maps")
-- All non plugin related (vim) options
require("options")

