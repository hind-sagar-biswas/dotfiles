# Usage: ask_choice "Prompt"
ask_choice() {
    local prompt="$1"

    if gum confirm "$prompt" --default=true --affirmative "Yes" --negative "No"; then
        return 0
    else
        return 1
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

	gum choose --header "$prompt" "${choices[@]}"
}
