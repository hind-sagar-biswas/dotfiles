mkdir -p "$HOME/.local/share/fonts/"
cp -r "$BASE/fonts/*" "$HOME/.local/share/fonts/"
fc-cache -f -v
