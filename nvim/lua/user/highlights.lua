--Visual highlights
local options = {
    cursorline = true,
    termguicolors = false,
    winblend = 0,
    wildoptions = 'pum',
    pumblend = 5,
    background = 'dark',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
