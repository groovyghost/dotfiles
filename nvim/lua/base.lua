-- Default Neovim options
local opt = vim.opt

-- Line numbers and tabs
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "both"
opt.tabstop = 4
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 2

-- Search and split
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.splitright = true
opt.splitbelow = true

-- UI settings
opt.signcolumn = "yes"
opt.scrolloff = 7
opt.termguicolors = true
opt.showtabline = 2
opt.laststatus = 2
opt.pumheight = 7

-- Character rendering and spellcheck
opt.list = true
opt.listchars = { tab = "⇥ ", leadmultispace = "┊ ", trail = "␣", nbsp = "⍽" }
opt.showbreak = "↪"
opt.breakindent = true
opt.spell = false
opt.spelllang = "en"
opt.spellsuggest = "best,8"
opt.spelloptions = "camel"

-- Folding and timing
opt.foldenable = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 2
opt.updatetime = 250
opt.timeoutlen = 300

-- Other settings, mouse, confirm, swap, and undo
opt.mouse = "nv"
opt.confirm = true
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true
opt.undolevels = 100

-- Auto-Commands
local api = vim.api

-- Remove trailing whitespace on save
api.nvim_create_autocmd("BufWritePre", { command = [[:%s/\s\+$//e]] })

-- Disable New Line Comment on buffer enter
api.nvim_create_autocmd("BufEnter", { callback = function() vim.opt.formatoptions:remove({ "c", "r", "o" }) end })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", { callback = function() vim.highlight.on_yank() end })

-- Go to last location when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close windows with "q" for specific file types
api.nvim_create_autocmd("FileType", {
  pattern = { "help", "man", "notify","sagaoutline", "qf", "PlenaryTestPopup" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- Keymaps
local map = vim.keymap.set

-- Space as the leader
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true, noremap = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap for dealing with visual line wraps
map( "n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map( "n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Paste over currently selected text without yanking it
map("x", "p", '"_dp')
map("x", "P", '"_dP')

map("n", "<leader>s", ":split<CR>", { desc = "Horizontal split" })
map("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical split" })

-- Tabs
map("n", "<tab>", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<S-tab>", ":tabprevious<CR>", { desc = "Prev tab" })
map("n", "<leader>x", ":tabclose<CR>", { desc = "Close current tab" })

-- Cancel search highlighting with ESC
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear hlsearch and ESC" })

-- Visual Maps
map("v", "J", ":m '>+1<CR>gv=gv") -- Move current line down
map("v" , "K", ":m '>-2<CR>gv=gv")   -- Move current line up

-- Stay in my sight
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- NETRW
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0    --> 0: Simple, 1: Detailed, 2: Thick, 3: Tree
vim.g.netrw_browse_split = 3 --> Open file in 0: Reuse the same win, 1: Horizontal split, 2: Vertical split, 3: New tab
vim.g.netrw_winsize = 25     --> seems to be in percentage

vim.g.netrw_is_open = false
local function toggle_netrw()
  local fn = vim.fn
  if vim.g.netrw_is_open then
    for i = 1, fn.bufnr("$") do
      if fn.getbufvar(i, "&filetype") == "netrw" then
        vim.cmd("bwipeout " .. i)
      end
    end
    vim.g.netrw_is_open = false
  else
    vim.cmd("Lex")
    vim.g.netrw_is_open = true
  end
end
map("n", "<leader>n", toggle_netrw,
  { silent = true, noremap = true, desc = "Toggle [N]etrw" })

