local keymap = vim.api.nvim_set_keymap
local opts = { silent = true }
-- Disable arrow key (vim hard mode :p)
local modes = { 'n', 'i', 'v' }
local arrows = { '<Up>', '<Down>', '<Left>', '<Right>' }

for _, mode in ipairs(modes) do
  for _, arrow in ipairs(arrows) do
    keymap(mode, arrow, '<Nop>', {noremap = true, silent = true })
  end
end

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Split window
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Stay in my sight
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
