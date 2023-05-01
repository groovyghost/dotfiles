local map = vim.api.nvim_set_keymap
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end
-- Disable arrow keys
local modes = { 'n', 'i', 'v' }
local arrows = { '<Up>', '<Down>', '<Left>', '<Right>' }

for _,mode in ipairs(modes) do
  for _,arrow in ipairs(arrows) do
    map(mode, arrow, '<Nop>', { noremap = true, silent = true })
  end
end


map("v", "J", ":m '>+1<CR>gv=gv", {silent = true})
map("v", "K", ":m '<-2<CR>gv=gv", {silent = true})

-- Split window
map('n', '<leader>ss', ':split<Return><C-w>w', {silent = true, desc = 'Split Horizontal'})
map('n', '<leader>sv', ':vsplit<Return><C-w>w', {silent = true, desc = 'Split Vertical'})

-- Stay in my sight
map("n", "<C-d>", "<C-d>zz", {silent = true})
map("n", "<C-u>", "<C-u>zz", {silent = true})
map("n", "n", "nzzzv", {silent = true})
map("n", "N", "Nzzzv", {silent = true})

-- Tmux Navigation
map("n", "<C-h>", ":NavigatorLeft<CR>", { noremap = true, silent = true })
map("n", "<C-k>", ":NavigatorUp<CR>", { noremap = true, silent = true })
map("n", "<C-l>", ":NavigatorRight<CR>", { noremap = true, silent = true })
map("n", "<C-j>", ":NavigatorDown<CR>", { noremap = true, silent = true })

-- Buffer Navigation
map('n', '<C-t>', ':tabnew<CR>', {noremap = true, silent = true }) -- Create new buffer
map('n', '<A-,>', ':BufferPrevious<CR>', { noremap = true, silent = true, desc = "Buffer Previous"})
map('n', '<A-.>', ':BufferNext<CR>', { noremap = true, silent = true, desc = "Buffer Next"})
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', { noremap = true, silent = true, desc = "Buffer Move previous"})
map('n', '<A->>', ':BufferMoveNext<CR>', { noremap = true, silent = true, desc = "Buffer Move next"})
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', { noremap = true, silent = true})
map('n', '<A-2>', ':BufferGoto 2<CR>', { noremap = true, silent = true})
map('n', '<A-3>', ':BufferGoto 3<CR>', { noremap = true, silent = true})
map('n', '<A-4>', ':BufferGoto 4<CR>', { noremap = true, silent = true})
map('n', '<A-5>', ':BufferGoto 5<CR>', { noremap = true, silent = true})
map('n', '<A-6>', ':BufferGoto 6<CR>', { noremap = true, silent = true})
map('n', '<A-7>', ':BufferGoto 7<CR>', { noremap = true, silent = true})
map('n', '<A-8>', ':BufferGoto 8<CR>', { noremap = true, silent = true})
map('n', '<A-9>', ':BufferGoto 9<CR>', { noremap = true, silent = true})
map('n', '<A-0>', ':BufferLast<CR>', { noremap = true, silent = true})

-- Telescope
map('n', '<leader>fs', ":Telescope live_grep<CR>", {desc = 'Find String'})
map('n', '<leader>ff', ":Telescope find_files no_ignore=false hidden=true<CR>", {desc = 'Find Files'})
map('n', '<leader>e', ":Telescope file_browser path=%:p:h select_buffer=true respect_gitignore=false hidden=true grouped=true previewer=false initial_mode=normal<CR>", {silent = true, noremap = true, desc = 'File Browser'})
map('n', '<leader>gb', ":Telescope git_branches<CR>", {desc = 'Git Branches'})
map('n', '<leader>gc', ":Telescope git_commits<CR>", {desc = 'Git Commits'})

-- Neotree toggle
map('n',"<leader>fe", ":Neotree toggle<CR>", { silent = true, desc = 'Neotree Toggle'})
