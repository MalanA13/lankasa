#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"

source "$SCRIPT_DIR/components/hyprlock.sh"
source "$SCRIPT_DIR/components/waybar.sh"
source "$SCRIPT_DIR/components/wallpaper.sh"

THEME="$1"

load_theme "$THEME"

log_info "Loading theme components..."

apply_hyprlock
apply_waybar
apply_wallpaper

log_info "• Wofi (pending)"
log_info "• Notifications (pending)"

log_info "Components loaded."
