local status, telescope = pcall(require, "telescope")
if not status then
  return
end
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = "  ",
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_previous,
        ["<C-k>"] = actions.move_selection_next,
        ["<C-q>"] = actions.close,
      },
    },
  },
})

