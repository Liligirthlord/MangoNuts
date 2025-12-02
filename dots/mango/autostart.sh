#!/bin/bash

# ----- Restore wallpaper -----
if [ -f ~/.cache/current_wallpaper ]; then
    pkill swaybg
    swaybg -i "$(cat ~/.cache/current_wallpaper)" -m fill &
fi

# ----- Restore theme using matugen -----
if [ -f ~/.cache/current_wallpaper ]; then
    matugen image "$(cat ~/.cache/current_wallpaper)" >/dev/null 2>&1 &
fi

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots

