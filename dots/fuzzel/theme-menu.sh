#!/bin/bash
set -e

THEMES_DIR="$HOME/Themes"
THEMESET="/home/numbnuts/theme-set.sh"   # adjust if theme-set.sh is elsewhere

# Check theme-set.sh exists
if [ ! -x "$THEMESET" ]; then
    echo "Error: theme-set.sh not found or not executable."
    exit 1
fi

# Generate menu list
themes=$(ls -1 "$THEMES_DIR" | grep -v '^current$')

# Launch fuzzel menu
choice=$(printf "%s\n" "$themes" | fuzzel --dmenu --prompt "Choose Theme: ")

# If user cancelled
[ -z "$choice" ] && exit 0

# Call your theme apply script
"$THEMESET" "$choice"

