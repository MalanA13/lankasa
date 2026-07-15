#!/usr/bin/env bash

apply_wallpaper() {
    WALLPAPER_SOURCE="$THEME_DIR/$wallpaper"

    ensure_file "$WALLPAPER_SOURCE"

    "$ROOT_DIR/scripts/wallpaper-apply.sh" "$WALLPAPER_SOURCE" || exit 1

    log_info "✓ Wallpaper applied"
}
