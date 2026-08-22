HELPER=$(get_selection "Select AUR Helper" "paru" "yay")

## Check if helper already installed
if command -v $HELPER &> /dev/null; then
    echo "$HELPER already installed"
else
    cd "$DOWNLOADS"

    # Check if file already downloaded
    if [ -d "$HELPER" ]; then
	mv "$HELPER" "$HELPER.old"
    fi

    git clone "https://aur.archlinux.org/$HELPER.git"
    cd $HELPER
    makepkg -si
    cd "$BASE"
fi

if [ "$HELPER" = "paru" ]; then
    INSTALL_CMD="paru -S --noconfirm --needed --skipreview"
else
    INSTALL_CMD="yay -S --noconfirm --needed --answerdiff None --answeredit None "
fi

export INSTALL_CMD
