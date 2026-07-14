#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

category=$(find "$WALLPAPER_DIR" -mindepth 1 -maxdepth 1 -type d \
    | xargs -I {} basename {} \
    | sort \
    | wofi --dmenu --prompt "Wallpaper Category")

[ -z "$category" ] && exit

wallpaper=$(find "$WALLPAPER_DIR/$category" -maxdepth 1 -type f \
    | xargs -I {} basename {} \
    | sort \
    | wofi --dmenu --prompt "$category")

[ -z "$wallpaper" ] && exit

FULL_PATH="$WALLPAPER_DIR/$category/$wallpaper"

cat > "$HYPRPAPER_CONF" <<EOF
wallpaper {
    monitor = eDP-1
    path = $FULL_PATH
    fit_mode = cover
}

splash = false
ipc = true
EOF

echo "Wallpaper updated:"
echo "$FULL_PATH"
