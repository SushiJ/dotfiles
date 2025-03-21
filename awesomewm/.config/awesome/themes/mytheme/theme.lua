local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir()
themes_path = themes_path .. "themes/mytheme"

theme = {}

theme.font = "sans 10"

theme.bg_normal = "#222222"
theme.bg_focus = "#535d6c"
theme.bg_urgent = "#ff0000"
theme.bg_minimize = "#444444"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#aaaaaa"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.useless_gap = dpi(0)
theme.border_width = dpi(1)
theme.border_color_normal = "#000000"
theme.border_color_active = "#535d6c"
theme.border_color_marked = "#91231c"

theme.border_width = 1
theme.border_normal = "#000000"
theme.border_focus = "#535d6c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel = themes_path .. "/taglist/squarefw.png"
theme.taglist_squares_unsel = themes_path .. "/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
-- theme.menu_submenu_icon = "/usr/share/awesome/themes/openSUSE/submenu.png"
-- theme.menu_height = 15
-- theme.menu_width = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "/layouts/fairvw.png"
theme.layout_floating = themes_path .. "/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "/layouts/magnifierw.png"
theme.layout_max = themes_path .. "/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "/layouts/dwindlew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
