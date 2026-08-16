-------------------
--- DECORATIONS ---
-------------------

local colors = require("modules.colors")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 2,

		col = {
			active_border = colors.tertiary,
			inactive_border = colors.background,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 6,
			passes = 3,
			vibrancy = 0.1696,
			ignore_opacity = true,
			noise = 0.05,
			contrast = 1.5,
			xray = false,
			new_optimizations = true,
		},
	},

	animations = {
		enabled = true,
	},
})
