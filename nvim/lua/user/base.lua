--Basic options
vim.scriptencoding = 'utf-8'

local options = {
    backup = false,
    clipboard = "unnamedplus",
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = 'utf-8',
    hlsearch = true,
    cmdheight = 1,
    mouse = "a",
    ignorecase = true,
    autoindent = true,
    smartindent = true,
    backup = false,
    showmode = false,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    undofile = true,
    writebackup = false,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    wrap = false,
    backspace = { 'start', 'eol', 'indent' },
    --shell = 'fish',
    smarttab = true,
    breakindent = true,
    title = true,
    signcolumn = "yes",
    encoding = 'utf-8',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }