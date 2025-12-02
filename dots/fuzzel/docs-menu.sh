#!/bin/sh

choice=$(printf "󰣇  Arch Wiki\n  Manpages\n󰍹  MangoWC" \
    | fuzzel --dmenu --prompt "Docs: ")

case "$choice" in
    "󰣇  Arch Wiki")
        xdg-open "https://wiki.archlinux.org/" ;;
    "  Manpages")
        xdg-open "https://man.archlinux.org/" ;;
    "󰍹  MangoWC")
        xdg-open "https://github.com/DreamMaoMao/mangowc/wiki" ;;
    *)
        exit 0 ;;
esac

