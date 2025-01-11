-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = "tokyonight"
-- config.color_scheme = 'Gruvbox dark, hard (base16)'

-- Fonts
-- config.font = wezterm.font('FiraCode Nerd Font Mono', { weight = 'Medium' })
config.font = wezterm.font("ComicShannsMono Nerd Font")
-- config.font = wezterm.font("MesloLGM Nerd Font")
config.font_size = 14
config.line_height = 1.0

-- Background opacity
-- config.window_background_opacity = 0.9

config.colors = {
  background = "#16161E",
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
