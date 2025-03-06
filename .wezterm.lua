-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = "tokyonight"
-- config.color_scheme = "Gruvbox Material (Gogh)"

-- Fonts
-- config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular" })
config.font = wezterm.font("ComicShannsMono Nerd Font")
-- config.font = wezterm.font("MesloLGM Nerd Font Mono")
config.font_size = 14
config.line_height = 1.0

-- Background opacity
-- config.window_background_opacity = 0.9

config.colors = {
  -- background = "#1D2021",
  background = "#222436",
}

-- Window glass and wezterm tab bar
config.window_decorations = "NONE"
config.enable_tab_bar = false

config.window_frame = {
  active_titlebar_bg = "rgba(0 0 0 0)",
}

config.warn_about_missing_glyphs = false
config.audible_bell = "Disabled"

-- and finally, return the configuration to wezterm
return config
