#!/usr/bin/env bash

apply_waybar() {

    local WAYBAR_DIR="$THEME_DIR/$waybar"

    ensure_dir "$WAYBAR_DIR"

    link_file \
        "$WAYBAR_DIR/style.css" \
        "$HOME/.config/waybar/style.css"

    log_info "✓ Waybar linked"
}
