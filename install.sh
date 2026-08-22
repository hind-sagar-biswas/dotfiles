#!/usr/bin/env bash

set -euo pipefail

# --- Configuration ---
CFG_DIR="$HOME/.config"
BASE="$( dirname -- "${BASH_SOURCE[0]}" )"
DOWNLOADS="$HOME/Github"
SCRIPTS="$DOWNLOADS/linux-scripts"
BKUP_DIR="$HOME/.dotfiles_backup"

mkdir -p "$DOWNLOADS"
mkdir -p "$BKUP_DIR"

# --- Functions ---
source "$BASE/modules/func.sh"


# --- Package Manager and AUR setup ---
PKG_MANAGER=$(detect_package_manager)

if [ "$PKG_MANAGER" != "pacman" ]; then
	echo "Unsupported package manager: $PKG_MANAGER! Required: pacman"
	exit 1
fi


scripts=(
	"prereq"
	"update"
	"aur"
)

for script in "${scripts[@]}"; do
	source "$BASE/modules/$script.sh"
done


LN_DIRS=(
    "alacritty"
    "btop"
    "fastfetch"
    "ghostty"
    "hypr"
    "kitty"
    "matugen"
    "neofetch"
    "qutebrowser"
    "ranger"
    "swaync"
    "waybar"
    "wlogout"
    "wofi"
    "yt-dlp"
)

# Pacman Conf
# sudo cp $dotfiles/pacman.conf /etc/pacman.conf

$INSTALL_CMD -Syu --noconfirm

# Custom scripts
(cd $DOWNLOADS && git clone https://github.com/hind-sagar-biswas/linux-scripts.git || true)
ln --symbolic "$SCRIPTS" "$HOME/.scripts" || true

# Symlink Dotfiles
for dir in "${LN_DIRS[@]}"; do
    TG_DIR="$CFG_DIR/$dir"
    if [[ -d "$TG_DIR" ]]; then
	mv "$TG_DIR" "$BKUP_DIR/$dir"
    fi
    ln --symbolic "$BASE/$dir" "$TG_DIR"
done

PACKAGES=(
	"zsh"
	"bun"
	"zoxide"
	"atuin"
	"eza"
	"kitty"
	"alacritty"
	"ghostty"
	"btop"
	"cmatrix"
	"matugen-bin"
	"yt-dlp"
	"pokemon-colorscripts"
	"wofi"
	"rofi"
	"swaync"
	"bluez"
	"bluez-utils"
	"blueman"
	"pipewire"
	"wireplumber"
	"hyprland"
	"hyprshot"
	"hyprpaper"
	"hypridle"
	"hyprlock"
	"wlogout"
	"waybar"
	"xsel"
	"wl-clipboard"
	"cliphist"
	"hyprland-guiutils"
	"xdg-desktop-portal-hyprland"
	"miku-cursor-theme"
	"ttf-firacode-nerd"
	"ttf-jetbrains-mono-nerd"
	"brightnessctl"
	"networkmanager"
	"nmtui"
)

$INSTALL_CMD -S "${PACKAGES[@]}" --needed --noconfirm


# ZSH
if [[ -f "$HOME/.zshrc" || -L "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$BKUP_DIR/.zshrc"
fi
mv "$HOME/.zshrc" "$BKUP_DIR/.zshrc"
ln --symbolic "$BASE/.zshrc" "$HOME/.zshrc"

# Wallpaper & Colors
WP_DIR="$HOME/Wallpapers"
mkdir -p "$WP_DIR"
cp "$BASE/wallpapers/"* "$WP_DIR/"

matugen image "$WP_DIR/wall.jpg"


# Rofi Theme Setup
(cd $DOWNLOADS; git clone https://github.com/adi1090x/rofi.git || true; cd rofi; chmod +x setup.sh; ./setup.sh)

