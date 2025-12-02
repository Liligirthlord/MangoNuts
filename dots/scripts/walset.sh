#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
CACHE_FILE="$HOME/.cache/current_wallpaper"

# Select wallpaper using Hellpaper
SELECTED_WALLPAPER=$(hellpaper "$WALLPAPER_DIR" | tail -n 1)

# Save selected wallpaper to cache
echo "$SELECTED_WALLPAPER" > "$CACHE_FILE"

if [[ -z "$SELECTED_WALLPAPER" ]]; then
    echo "No wallpaper selected. Exiting."
    exit 1
fi

echo "Selected wallpaper: $SELECTED_WALLPAPER"

# Start swww daemon if not running
if ! pgrep swww-daemon >/dev/null; then
    swww-daemon &
    sleep 0.2
fi

# Set wallpaper with swww using random transition
swww img "$SELECTED_WALLPAPER" \
    --transition-type random \
    --transition-fps 60 \
    --transition-duration 0.5 \
    --transition-step 90

# Generate Matugen theme based on the selected wallpaper
matugen image -t scheme-content "$SELECTED_WALLPAPER"

makoctl reload

# Reload Mango/your window manager configs
mmsg -d reload_config

echo "Wallpaper applied with swww (random transition) and Matugen theme generated."

# Notify the user
notify-send "Wallpaper Updated" "Random transition applied and Matugen theme regenerated."

