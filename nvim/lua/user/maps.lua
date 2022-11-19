-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local keymap = vim.api.nvim_set_keymap
local opts = { silent = true }
keymap("", "<Space>", "<Nop>", opts) --Remap space as leader key
vim.g.mapleader = " "

keymap("n", "q", "<Nop>", opts) --Disable vim macros
keymap('i', 'jk', '<ESC>', opts) -- use jk to exit insert mode

keymap('n', '+', '<C-a>', opts) -- increment
keymap('n', '-', '<C-x>', opts) -- decrement

keymap('n', 'dw', 'vb"_d', opts) -- Delete a word backwards

-- window management
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sq", ":close<CR>", opts) -- close current split window

keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tq", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- toggle file explorer (nvim tree)

-- restart lsp server (not on youtube nvim video)
--keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary