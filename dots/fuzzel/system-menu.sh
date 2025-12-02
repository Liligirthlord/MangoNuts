#!/usr/bin/env bash

# Common Fuzzel options
FUZ_OPTS=(
    --dmenu
    --font "JetBrainsMono:size=10"
    --width 25
    --lines 9
    --inner-pad 10
    --horizontal-pad 25
    --line-height 25
    --border-width 2
    --border-radius 20
    --selection-radius 5
    --use-bold
    --hide-prompt
)

# Menu items (header + items)
ITEMS=(
    "───── System Menu ─────"   # HEADER (non-selectable)
    "  Apps"
    "  Documentation"
    "󰌌  Keybinds"
    "  Themes"
    "  Wifi"
    "  Audio"
    "  Bluetooth"
    "  Power"
)

# Show menu in dmenu mode
chosen=$(
    printf "%s\n" "${ITEMS[@]}" |
    fuzzel "${FUZ_OPTS[@]}" --prompt ""
)

# If Escape pressed or header clicked → exit
[ -z "$chosen" ] && exit
[ "$chosen" = "───── System Menu ─────" ] && exit

case "$chosen" in
    "  Apps")
        fuzzel &   # normal app launcher
        ;;
    "  Documentation")
	~/.config/fuzzel/docs-menu.sh &
	;;
    "󰌌  Keybinds")
        ~/.config/fuzzel/show-keybinds.sh &
	;;
    "  Themes")
        fuzzel "${FUZ_OPTS[@]}" --prompt "  Themes:" < <(ls ~/.themes)
        ;;
    "  Wifi")
        alacritty -e impala &
        ;;
    "  Audio")
        alacritty -e pulsemixer &
        ;;
    "  Bluetooth")
        alacritty -e bluetuith &
        ;;
    "  Power")
        wlogout
        ;;
esac

