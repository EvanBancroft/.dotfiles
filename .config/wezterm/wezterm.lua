-- Pull in the wezterm API
local wezterm = require("wezterm")

local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

local kanagawa_dragon_colors = {
	foreground = "#c5c9c5",
	background = "#181616",
	-- background = "#000000",

	cursor_bg = "#C8C093",
	cursor_fg = "#C8C093",
	cursor_border = "#C8C093",

	selection_fg = "#C8C093",
	selection_bg = "#2D4F67",

	scrollbar_thumb = "#16161D",
	split = "#16161D",

	ansi = {
		"#0D0C0C",
		"#C4746E",
		"#8A9A7B",
		"#C4B28A",
		"#8BA4B0",
		"#A292A3",
		"#8EA4A2",
		"#C8C093",
	},
	brights = {
		"#A6A69C",
		"#E46876",
		"#87A987",
		"#E7C384",
		"#7FB4CA",
		"#938AA9",
		"#7AA89F",
		"#C5C9C5",
	},
	indexed = { [16] = "#B6927B", [17] = "#B98D7B" },
}

-- print the workspace name at the upper right
wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

-- This is where you actually apply your config choices

config.color_schemes = {
	["Kanagawa (Dragon)"] = kanagawa_dragon_colors,
}

config.color_scheme = "rose-pine"

config.font = wezterm.font("JetBrainsMonoNL Nerd Font Propo")

config.window_background_opacity = 0.95
config.macos_window_background_blur = 40

config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "~"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.6,
	brightness = 0.6,
}

-- Keys
config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},
	{
		key = "Enter",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
}

-- Tab bar
config.status_update_interval = 1000
config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config
