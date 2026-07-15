#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

THEME="$1"

if [[ -z "$THEME" ]]; then
    log_error "No theme specified."
    exit 1
fi

load_theme "$THEME"

log_info "Theme '$THEME' found."
log_info "Manifest found."

#
# Required Variables
#

require_variable() {
    local name="$1"
    local value="$2"

    if [[ -z "$value" ]]; then
        log_error "Missing required variable: $name"
        exit 1
    fi
}

require_variable "accent" "$accent"
require_variable "accent_bg" "$accent_bg"
require_variable "bg" "$bg"
require_variable "fg" "$fg"
require_variable "text" "$text"
require_variable "active_text" "$active_text"

#
# Assets
#

ensure_file "$THEME_DIR/$preview"
ensure_file "$THEME_DIR/$wallpaper"

#
# Components
#

# Waybar
ensure_dir "$THEME_DIR/$waybar"
ensure_file "$THEME_DIR/$waybar/style.css"

# Hypr
ensure_dir "$THEME_DIR/$hypr"
ensure_file "$THEME_DIR/$hypr/hyprlock.conf"

# Wofi
ensure_dir "$THEME_DIR/$wofi"
ensure_file "$THEME_DIR/$wofi/style.css"
ensure_file "$THEME_DIR/$wofi/config"

# SwayNC
ensure_dir "$THEME_DIR/$swaync"
ensure_file "$THEME_DIR/$swaync/config.json"
ensure_file "$THEME_DIR/$swaync/style.css"

#
# Optional Components
#

# Kitty
if [[ -n "$kitty" ]]; then
    ensure_dir "$THEME_DIR/$kitty"
    ensure_file "$THEME_DIR/$kitty/kitty.conf"
fi


log_info "Theme validated."

exit 0
