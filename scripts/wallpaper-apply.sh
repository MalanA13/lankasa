#!/usr/bin/env bash

WALLPAPER="$1"

if [[ -z "$WALLPAPER" ]]; then
    echo "No wallpaper specified."
    exit 1
fi

HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

cat > "$HYPRPAPER_CONF" <<EOF
wallpaper {
    monitor = eDP-1
    path = $WALLPAPER
    fit_mode = cover
}

splash = false
ipc = true
EOF

exit 0
