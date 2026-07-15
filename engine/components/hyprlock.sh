#!/usr/bin/env bash

apply_hyprlock() {
    HYPRLOCK_SOURCE="$THEME_DIR/$hyprlock"
    HYPRLOCK_TARGET="$HOME/.config/hypr/hyprlock.conf"

    ensure_file "$HYPRLOCK_SOURCE"

    ln -sfn "$HYPRLOCK_SOURCE" "$HYPRLOCK_TARGET"

    log_info "✓ Hyprlock linked"
}
