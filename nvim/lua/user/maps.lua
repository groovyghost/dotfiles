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
--Disable arrows in insert_mode and normal_mode
keymap("n", "<up>", "<Nop>", opts)
keymap("n", "<down>", "<Nop>", opts)
keymap("n", "<right>", "<Nop>", opts)
keymap("n", "<left>", "<Nop>", opts)
keymap("i", "<up>", "<Nop>", opts)
keymap("i", "<down>", "<Nop>", opts)
keymap("i", "<right>", "<Nop>", opts)
keymap("i", "<left>", "<Nop>", opts)
keymap("i", "jk", "<ESC>", opts) -- use jk to exit insert mode
keymap("i", "kj", "<ESC>", opts) -- use jk to exit insert mode

keymap("n", "+", "<C-a>", opts) -- increment
keymap("n", "-", "<C-x>", opts) -- decrement

keymap("n", "dw", 'vb"_d', opts) -- Delete a word backwards

-- window management
-- New tab
keymap('n', 'te', ':tabedit', opts)
-- Split window
keymap('n', 'ss', ':split<Return><C-w>w',opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)
-- Move window
keymap('n', '<Space>', '<C-w>w',opts)
keymap('', 'sh', '<C-w>h',opts)
keymap('', 'sk', '<C-w>k',opts)
keymap('', 'sj', '<C-w>j',opts)
keymap('', 'sl', '<C-w>l', opts)
keymap('n', '<leader>md', '<cmd>MarkdownPreviewToggle<cr>', opts)

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- toggle file explorer (nvim tree)
keymap("n", "<leader>ee", ":NvimTreeFocus<CR>", opts) -- toggle file explorer (nvim tree)

-- restart lsp server
keymap("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

-- telescope
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ cwd = vim.fn.expand('%:p:h'), previewer = false }))<cr>", opts) -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type

keymap("n", "<leader>;e", "<cmd>lua require'telescope.builtin'.diagnostics()<cr>",opts)
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts) -- list git branches (use <cr> to checkout) ["gb" for git branch]
