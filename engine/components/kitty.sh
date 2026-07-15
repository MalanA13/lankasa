#!/usr/bin/env bash

apply_kitty() {

    local KITTY_DIR="$THEME_DIR/$kitty"

    ensure_dir "$KITTY_DIR"

    link_file \
        "$KITTY_DIR/kitty.conf" \
        "$HOME/.config/kitty/kitty.conf"

    log_info "✓ Kitty linked"
}
