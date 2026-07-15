#!/usr/bin/env bash

apply_waybar() {
    WAYBAR_SOURCE="$THEME_DIR/$waybar"
    WAYBAR_TARGET="$HOME/.config/waybar/style.css"

    ensure_file "$WAYBAR_SOURCE"

    ln -sfn "$WAYBAR_SOURCE" "$WAYBAR_TARGET"

    log_info "✓ Waybar linked"
}
