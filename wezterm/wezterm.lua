-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- Set up a callback for the GUI startup event
wezterm.on("gui-startup", function(cmd)
  -- Spawn a new window, tab, and pane, and maximize the window
  local tab, pane, window = mux.spawn_window(cmd or {})
  --window:gui_window():maximize()
  window:gui_window():set_position(66, 100)
  window:gui_window():set_inner_size(1790, 940)
end)

-- Configure wezterm settings
local config = {
  default_prog = { os.getenv("SHELL") },
  color_scheme = "Tokyo Night",
  font = wezterm.font_with_fallback({
    { family = "ComicShannsMono Nerd Font", scale = 1.2, weight = "Medium" },
  }),
  warn_about_missing_glyphs = false,
  window_background_opacity = 0.97,
  window_decorations = "RESIZE",
  window_close_confirmation = "AlwaysPrompt",
  scrollback_lines = 10000,
  default_workspace = "main",
  adjust_window_size_when_changing_font_size = true,

  window_padding = {
    left = "0.5cell",
    right = "0.5cell",
    top = "0.5cell",
    bottom = "0cell",
  },

  -- Dim inactive panes
  inactive_pane_hsb = {
    saturation = 0.24,
    brightness = 0.5,
  },

  -- Tab bar configuration
  use_fancy_tab_bar = false,
  enable_tab_bar = true,
  status_update_interval = 1000,
  show_new_tab_button_in_tab_bar = true,
  show_tab_index_in_tab_bar = true,
  show_tabs_in_tab_bar = true,

  -- Mouse bindings
  disable_default_mouse_bindings = false,
  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "",
      action = act.CompleteSelectionOrOpenLinkAtMouseCursor("Clipboard"),
    },
  },
}
-- Return the configured settings
return config
