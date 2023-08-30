local map = vim.keymap.set
-- Disable arrow keys
local modes = { 'n', 'i', 'v' }
local arrows = { '<Up>', '<Down>', '<Left>', '<Right>' }

for _, mode in ipairs(modes) do
  for _, arrow in ipairs(arrows) do
    map(mode, arrow, '<Nop>', { noremap = true, silent = true })
  end
end

vim.keymap.set('n', "<leader>t", require 'util'.spawn_floating_term(),
  { noremap = true, silent = true, desc = "[T]erminal" })

-- For indenting
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })

-- Split window
map('n', '<leader>ss', ':split<Return><C-w>w', { silent = true, desc = 'Split Horizontal' })
map('n', '<leader>sv', ':vsplit<Return><C-w>w', { silent = true, desc = 'Split Vertical' })

-- Stay in my sight
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- Tmux Navigation
map("n", "<A-h>", ":NavigatorLeft<CR>", { noremap = true, silent = true })
map("n", "<A-k>", ":NavigatorUp<CR>", { noremap = true, silent = true })
map("n", "<A-l>", ":NavigatorRight<CR>", { noremap = true, silent = true })
map("n", "<A-j>", ":NavigatorDown<CR>", { noremap = true, silent = true })

-- Harpoon
map("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { desc = "[H]arpoon [A]dd" })
map("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "[H]arpoon [T]oggle-menu" })
map("n", "<C-j>", ":lua require('harpoon.ui').nav_next()<CR>", {})
map("n", "<C-k>", ":lua require('harpoon.ui').nav_prev()<CR>", {})
map("n", "<C-1>", ":lua require('harpoon.ui').nav_file(1)<CR>", {})
map("n", "<C-2>", ":lua require('harpoon.ui').nav_file(2)<CR>", {})
map("n", "<C-3>", ":lua require('harpoon.ui').nav_file(3)<CR>", {})
map("n", "<C-4>", ":lua require('harpoon.ui').nav_file(4)<CR>", {})

-- Telescope
map('n', '<leader>fs', ":Telescope live_grep<CR>", { desc = '[F]ind [S]tring' })
map('n', '<leader>ff', ":Telescope find_files no_ignore=false hidden=true<CR>", { desc = '[F]ind [F]iles' })
map('n', '<leader>fr', ":Telescope oldfiles<CR>", { desc = '[F]ind [r]ecently opened files' })
map('n', '<leader>e',
  ":Telescope file_browser path=%:p:h select_buffer=true respect_gitignore=false hidden=true grouped=true previewer=false initial_mode=normal<CR>",
  { silent = true, noremap = true, desc = 'File [E]xplorer' })
map('n', '<leader>gb', ":Telescope git_branches<CR>", { desc = '[G]it [B]ranches' })
map('n', '<leader>gc', ":Telescope git_commits<CR>", { desc = '[G]it [C]ommits' })


--Disable unused
map("n", 'q:', "<nop>", { silent = true })
map("n", 'Q', "<nop>", { silent = true })
