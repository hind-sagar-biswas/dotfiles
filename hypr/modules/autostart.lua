-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	hl.exec_cmd("waybar & swaync & hyprpaper & hypridle")

	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'miku-cursor-linux'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")

	hl.exec_cmd("hyprctl setcursor miku-cursor-linux 24")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
