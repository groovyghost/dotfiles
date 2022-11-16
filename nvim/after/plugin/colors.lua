-- Nord Config
vim.g.nord_contrast = false
vim.g.nord_borders = false
vim.g.nord_disable_background = true
vim.g.nord_cursorline_transparent = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = false
vim.g.nord_bold = false

-- Load the colorscheme

local status_ok,nord = pcall(require, "nord")
if not status_ok then
  vim.notify("nord error")
  return
end

nord.set()