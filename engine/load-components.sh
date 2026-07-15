#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

THEME="$1"

load_theme "$THEME"

log_info "Loading theme components..."

#
# Hyprlock
#

HYPRLOCK_SOURCE="$THEME_DIR/$hyprlock"
HYPRLOCK_TARGET="$HOME/.config/hypr/hyprlock.conf"

ensure_file "$HYPRLOCK_SOURCE"

ln -sfn "$HYPRLOCK_SOURCE" "$HYPRLOCK_TARGET"

log_info "✓ Hyprlock linked"

#
# Waybar
#

WAYBAR_SOURCE="$THEME_DIR/$waybar"
WAYBAR_TARGET="$HOME/.config/waybar/style.css"

ensure_file "$WAYBAR_SOURCE"

ln -sfn "$WAYBAR_SOURCE" "$WAYBAR_TARGET"

log_info "✓ Waybar linked"

#
# Wallpaper
#

WALLPAPER_SOURCE="$THEME_DIR/$wallpaper"

ensure_file "$WALLPAPER_SOURCE"

"$ROOT_DIR/scripts/wallpaper-apply.sh" "$WALLPAPER_SOURCE" || exit 1

log_info "✓ Wallpaper applied"

log_info "• Wofi (pending)"
log_info "• Notifications (pending)"

log_info "Components loaded."
