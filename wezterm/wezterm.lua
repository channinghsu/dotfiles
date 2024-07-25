-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 18

config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 9
config.scrollback_lines = 3000
config.color_scheme = "catppuccin-macchiato"

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

-- and finally, return the configuration to wezterm
return config
