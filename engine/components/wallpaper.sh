#!/usr/bin/env bash

apply_wallpaper() {

    local wallpaper_source="$THEME_DIR/$wallpaper"

    ensure_file "$wallpaper_source"

    "$ROOT_DIR/scripts/wallpaper-apply.sh" "$wallpaper_source" || exit 1

    log_info "✓ Wallpaper applied"
}
