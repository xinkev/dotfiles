-- vim: softtabstop=2 shiftwidth=2
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font('Menlo')
config.default_cursor_style = 'BlinkingBar'
config.freetype_load_target = 'HorizontalLcd'
config.color_scheme = 'Visibone Alt. 2 (terminal.sexy)'
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.8
config.macos_window_background_blur = 40
-- cf. https://github.com/wez/wezterm/issues/431
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = 'NeverPrompt'
-- hide scrollbar
config.enable_scroll_bar = false
config.line_height = 1.3
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

local act = wezterm.action

config.keys = {{
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action {
        SendString = "\x1bOH"
    }
}, {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action {
        SendString = "\x1bOF"
    }
}, {
    key = 'LeftArrow',
    mods = 'CTRL',
    action = act.SendString '\x1bb'
}, {
    key = 'RightArrow',
    mods = 'CTRL',
    action = act.SendString '\x1bf'
}}

-- and finally, return the configuration to wezterm
return config
