#!/usr/bin/env bash

set -euo pipefail

# --- Configuration ---

CONFIG_DIR="$HOME/.config"
DOTFILES="$PWD"

# --- Functions ---

## Usage: ask_choice "Prompt" <default> ["N" or "Y"]
ask_choice() {
    local prompt="$1"
    local default="$2" 
    local choice
    
    read -n 1 -p "$prompt " choice
    echo "" 
    
    choice="${choice:-$default}"

    if [[ "$choice" =~ ^[Yy]$ ]]; then
        return 0 # True
    else
        return 1 # False
    fi
}

detect_package_manager() {
    if command -v apt &> /dev/null; then
        echo "apt"
    elif command -v dnf &> /dev/null; then
        echo "dnf"
    elif command -v yum &> /dev/null; then
        echo "yum"
    elif command -v pacman &> /dev/null; then
        echo "pacman"
    elif command -v zypper &> /dev/null; then
        echo "zypper"
    elif command -v apk &> /dev/null; then
        echo "apk"
    else
        echo "unknown"
    fi
}

# Usage: "Prompt Message" "Option 1" "Option 2" ...
get_selection() {
    local prompt="$1"
    shift
    local choices=("$@")
    local num_choices=${#choices[@]}

    # Display the choices with 1...n indices
    for i in "${!choices[@]}"; do
        printf "%d) %s\n" "$((i + 1))" "${choices[$i]}"
    done

    read -p "$prompt [default 1]: " user_input

    # If invalid or empty, default to index 1
    if [[ ! "$user_input" =~ ^[0-9]+$ ]] || [ "$user_input" -lt 1 ] || [ "$user_input" -gt "$num_choices" ]; then
        user_input=1
    fi

    echo "${choices[$((user_input - 1))]}"
}

# Usage: "helper"
install_aur_helper() {
	local helper=$1
	sudo pacman -S --needed git base-devel

	mkdir -p "$HOME/Github"
	cd "$HOME/Github"
	git clone "https://aur.archlinux.org/$helper.git"
	cd $helper
	makepkg -si
	cd "$DOTFILES"
}


# --- Defaults ---
DISTRO_TYPE="deb"
PKG_MANAGER=$(detect_package_manager)

## If not pacman or apt
if [ "$PKG_MANAGER" != "pacman" ] && [ "$PKG_MANAGER" != "apt" ]; then
    echo "Error: No supported package manager found." >&2
    exit 1
elif [ "$PKG_MANAGER" = "pacman" ]; then
	DISTRO_TYPE="arch"
	echo "Updating Repositories..."
	sudo pacman -Sy

	## Select AUR Helper
	local helper=$(get_selection "Pacman Detected! Select AUR Helper" "paru", "yay")
	install_aur_helper "$helper"
	PKG_MANAGER=$helper

	if [ "$helper" = "paru" ]; then
		INSTALL_CMD="paru -S --noconfirm --needed --skipreview"
	else
		INSTALL_CMD="yay -S --noconfirm --needed --answerdiff None --answeredit None "
	fi
else
	echo "Updating Repositories..."
	sudo apt update

	INSTALL_CMD="sudo apt install -y"
fi


# --- Boolean Choices ---

ZSH=false
BTOP=false
YTDLP=false
HYPRLAND=false		# Setup Hyprland, hyprpaper, hyprlock, hypridle, waybar, wofi

ask_choice "Install Zsh? (y/N)" "N" && ZSH=true
ask_choice "Install btop? (y/N)" "N" && BTOP=true
ask_choice "Install fastfetch? (y/N)" "N" && FASTFETCH=true

if [ "$DISTRO_TYPE" = "arch" ]; then
	ask_choice "Setup Hyprland? (y/N)" "N" && HYPRLAND=true
	ask_choice "Install youtube downloader? (y/N)" "N" && YTDLP=true
fi

# --- Multi Choices ---

TERMINAL=$(get_selection "Select Terminal" "kitty" "alacritty" "ghostty")
FETCHER=$(get_selection "Select Fetcher" "fastfetch", "neofetch", "nitch", "pokemon-colorscripts")
NODE=$(get_selection "Select Node Version Manager" "bun", "npm", "pnpm", "yarn")
