#!/usr/bin/env bash

apply_wofi() {

    WOFI_SOURCE="$THEME_DIR/wofi"

    ensure_dir "$WOFI_SOURCE"

    link_file \
        "$WOFI_SOURCE/style.css" \
        "$HOME/.config/wofi/style.css"

    link_file \
        "$WOFI_SOURCE/config" \
        "$HOME/.config/wofi/config"

    log_info "✓ Wofi linked"
}
