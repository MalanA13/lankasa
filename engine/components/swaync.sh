#!/usr/bin/env bash

apply_swaync() {

    local SWAYNC_DIR="$THEME_DIR/$swaync"

    ensure_dir "$SWAYNC_DIR"

    link_file \
        "$SWAYNC_DIR/config.json" \
        "$HOME/.config/swaync/config.json"

    link_file \
        "$SWAYNC_DIR/style.css" \
        "$HOME/.config/swaync/style.css"

    log_info "✓ SwayNC linked"
}
