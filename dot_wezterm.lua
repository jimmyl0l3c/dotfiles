local wezterm = require('wezterm')

local config = wezterm.config_builder()

local act = wezterm.action
config.keys = {}
for i = 1, 8 do
  -- F1 through F8 to activate that tab
  table.insert(config.keys, {
    key = 'F' .. tostring(i),
    action = act.ActivateTab(i - 1),
  })
end

-- config.default_prog = { 'C:/Program Files/PowerShell/7/pwsh.ee' }

config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 12

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = 'rose-pine'

config.colors = {
    selection_fg = 'none',
    selection_bg = '#403d52',

    tab_bar = {
        background = '#191724',
        active_tab = {
            bg_color = '#745797',
            fg_color = '#e0def4',
            intensity = 'Normal',
        },
        inactive_tab = {
            bg_color = '#26233a',
            fg_color = '#808080',
        },
        inactive_tab_hover = {
            bg_color = '#c4a7e7',
            fg_color = '#ffffff',
            italic = true,
        },
        new_tab = {
            bg_color = '#1b1032',
            fg_color = '#808080',
        },
        new_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#909090',
            italic = true,
        },
    },
}

config.window_background_opacity = 1.0

return config
