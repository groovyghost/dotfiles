local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- Footer
local count = #vim.tbl_keys(packer_plugins)
default_footer = " Neovim Loaded with " .. count .. " plugins"
-- Banner
local banner = {
  "                                                    ",
  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                    ",
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
  dashboard.button(
    "f",
    "  Find file",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ cwd = vim.fn.expand('%:p:h'), previewer = false }))<cr>"
  ),
  dashboard.button("e", "  New file", ":ene<CR>"),
  dashboard.button("s", "  Settings", ":e ~/.config/nvim/<CR>"),
  dashboard.button("u", "  Theme", ":Telescope colorscheme<CR>"),
  dashboard.button("q", "  Quit", ":q<CR>"),
}

dashboard.section.footer.val = default_footer

alpha.setup(dashboard.config)
