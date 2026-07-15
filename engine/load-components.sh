#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"

THEME="$1"

load_theme "$THEME"

log_info "Loading theme components..."

COMPONENTS=(
    hyprlock
    waybar
    wallpaper
    wofi
    kitty
    swaync
)

for component in "${COMPONENTS[@]}"; do

    source "$SCRIPT_DIR/components/$component.sh"

    "apply_$component"

done

log_info "• Notifications (pending)"

log_info "Components loaded."
