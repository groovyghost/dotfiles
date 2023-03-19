local keymap = vim.api.nvim_set_keymap
local opts = { silent = true }

-- Disable arrow keys in normal, insert, and visual modes
keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })
keymap('i', '<Up>', '<Nop>', { noremap = true, silent = true })
keymap('i', '<Down>', '<Nop>', { noremap = true, silent = true })
keymap('i', '<Left>', '<Nop>', { noremap = true, silent = true })
keymap('i', '<Right>', '<Nop>', { noremap = true, silent = true })
keymap('v', '<Up>', '<Nop>', { noremap = true, silent = true })
keymap('v', '<Down>', '<Nop>', { noremap = true, silent = true })
keymap('v', '<Left>', '<Nop>', { noremap = true, silent = true })
keymap('v', '<Right>', '<Nop>', { noremap = true, silent = true })

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Split window
keymap('n', 'ss', ':split<Return><C-w>w',opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)
