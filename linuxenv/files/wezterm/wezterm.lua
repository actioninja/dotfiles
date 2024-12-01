local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'nord'

--- dark colors
nord0 = "#2E3440"
nord1 = "#3B4252"
nord2 = "#434C5E"
nord3 = "#4C566A"
--- light colors
nord4 = "#D8DEE9"
nord5 = "#E5E9F0"
nord6 = "#ECEFF4"
--- blues
nord7 = "#8FBCBB"
nord8 = "#88C0D0"
nord9 = "#81A1C1"
nord10 = "#5E81AC"
--- reds
nord11 = "#BF616A"
nord12 = "#D08770"
nord13 = "#EBCB8B"
nord14 = "#A3BE8C"
nord15 = "#B48EAD"


config.window_frame = {
  active_titlebar_bg = nord1,
  inactive_titlebar_bg = nord1,
}

config.colors = {
  tab_bar = {
    active_tab = {
      fg_color = nord5,
      bg_color = nord0,
    },
    inactive_tab = {
      bg_color = nord3,
      fg_color = nord4,
    },
    inactive_tab_hover = {
      bg_color = nord4,
      fg_color = nord3,
    },
    new_tab = {
      bg_color = nord3,
      fg_color = nord4,
    },
    new_tab_hover = {
      bg_color = nord4,
      fg_color = nord3,
    },
  },
}


return config
