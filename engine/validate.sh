#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

THEME="$1"

if [[ -z "$THEME" ]]; then
    log_error "No theme specified."
    exit 1
fi

THEME_DIR="$THEMES_DIR/$THEME"

ensure_dir "$THEME_DIR"

MANIFEST="$THEME_DIR/theme.conf"

ensure_file "$MANIFEST"
source "$MANIFEST"

log_info "Theme '$THEME' found."
log_info "Manifest found."

ensure_file "$THEME_DIR/$wallpaper"
ensure_file "$THEME_DIR/$preview"
ensure_file "$THEME_DIR/$waybar"
ensure_file "$THEME_DIR/$hyprlock"

log_info "Theme assets validated."
exit 0
