#!/usr/bin/env bash

apply_hyprlock() {

    local HYPR_DIR="$THEME_DIR/$hypr"

    ensure_dir "$HYPR_DIR"

    link_file \
        "$HYPR_DIR/hyprlock.conf" \
        "$HOME/.config/hypr/hyprlock.conf"

    log_info "✓ Hyprlock linked"
}
