--Visual highlights
local options = {
    cursorline = true,
    termguicolors = true,
    winblend = 0,
    wildoptions = 'pum',
    pumheight = 6,
    pumblend = 5,
    background = 'dark',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end