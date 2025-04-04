local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night Night'
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

-- visual changes for windows
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

return config
