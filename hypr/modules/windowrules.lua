-----------------
---- WINDOWS ----
-----------------

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.layer_rule({
	name = "swaync-control-center",
	match = { namespace = "swaync-control-center" },
	blur = true,
	ignore_alpha = 0.5,
})

hl.layer_rule({
	name = "swaync-notification-window",
	match = { namespace = "swaync-notification-window" },
	blur = true,
	ignore_alpha = 0.5,
})

hl.layer_rule({
	name = "logout_dialog",
	match = { namespace = "logout_dialog" },
	blur = true,
	animation = "slide",
})

hl.window_rule({
	name = "move-hyprland-run",
	match = {
		class = "hyprland-run",
	},
	move = "20 monitor_h-120",
	float = true,
})
