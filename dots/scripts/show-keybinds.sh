#!/usr/bin/env bash

KEYBINDS_FILE="$HOME/.config/mango/keybinds.conf"

grep "^bind=" "$KEYBINDS_FILE" \
    | sed 's/^bind=//' \
    | awk -F',' '
{
    mod=$1
    key=$2
    action=$3
    cmd=$4

    # remove whitespace
    gsub(/[[:space:]]+/, "", mod)
    gsub(/[[:space:]]+/, "", key)
    gsub(/[[:space:]]+/, "", action)

    # format modifier: replace + with " + "
    gsub(/\+/, " + ", mod)

    printf "%-35s → %-20s\n", mod " + " key, action
}
' | fuzzel --dmenu --prompt="Keybinds: " --width=60

