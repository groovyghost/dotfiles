--Vim filetype plugin file
--Language:	Python

--As suggested by PEP8.
-- use pep8 standards
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.colorcolumn = "120"
-- folds based on indentation https://neovim.io/doc/user/fold.html#fold-indent
vim.opt_local.foldmethod = "indent"

-- automatically capitalize boolean values.
vim.cmd.inoreabbrev("<buffer> true True")
vim.cmd.inoreabbrev("<buffer> false False")

-- in the same way, we can fix habits regarding comments or None
vim.cmd.inoreabbrev("<buffer> null None")
vim.cmd.inoreabbrev("<buffer> none None")
vim.cmd.inoreabbrev("<buffer> nil None")
