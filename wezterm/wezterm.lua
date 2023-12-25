-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

-- Set up a callback for the GUI startup event
wezterm.on('gui-startup', function(cmd)
  -- Spawn a new window, tab, and pane, and maximize the window
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Configure wezterm settings
local config = {
  default_prog = { os.getenv("SHELL") },
  color_scheme = "Tokyo Night",
  font = wezterm.font_with_fallback({
    { family = "ComicShannsMono Nerd Font", scale = 1.2, weight = "Medium" },
  }),
  warn_about_missing_glyphs = false,
  window_background_opacity = 1,
  window_decorations = "RESIZE",
  window_close_confirmation = "AlwaysPrompt",
  scrollback_lines = 10000,
  default_workspace = "main",

  window_padding = {
    left = '0.5cell',
    right = '0.5cell',
    top = '0.5cell',
    bottom = '0cell',
  },

  -- Dim inactive panes
  inactive_pane_hsb = {
    saturation = 0.24,
    brightness = 0.5
  },

  -- Tab bar configuration
  use_fancy_tab_bar = false,
  status_update_interval = 1000,
  show_new_tab_button_in_tab_bar = false,
  show_tab_index_in_tab_bar = false,
  show_tabs_in_tab_bar = false,

  -- Mouse bindings
  disable_default_mouse_bindings = false,
  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "",
      action = act.CompleteSelectionOrOpenLinkAtMouseCursor("Clipboard"),
    }
  }
}

-- Set up a callback for the update-status event
wezterm.on("update-status", function(window, pane)
  -- Helper function to extract the basename from a path
  local basename = function(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end

  -- Get current working directory and command
  local cwd = pane:get_current_working_dir() and basename(pane:get_current_working_dir()) or ""
  local cmd = pane:get_foreground_process_name() and basename(pane:get_foreground_process_name()) or ""

  -- Get the current time
  local time = wezterm.strftime("%H:%M")

  -- Set left status (left of the tab line)
  window:set_left_status(wezterm.format({
    { Text = "| " },
    { Foreground = { Color = "#f7768e" } },
    { Text = wezterm.nerdfonts.md_cat },
    "ResetAttributes",
    { Text = " | " },
    { Foreground = { Color = "#e0af68" } },
    { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
    "ResetAttributes",
    { Text = " | " },
  }))

  -- Set right status
  window:set_right_status(wezterm.format({
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
    { Foreground = { Color = "#e0af68" } },
    "ResetAttributes",
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
    { Text = "  " },
  }))
end)

-- Return the configured settings
return config

