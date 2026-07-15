#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

log_info "Lankasa Health Check"

echo

check_process() {
    local process="$1"
    local label="$2"

    if pgrep -x "$process" >/dev/null; then
        printf "✓ %-15s running\n" "$label"
    else
        printf "✗ %-15s not running\n" "$label"
    fi
}

check_binary() {
    local binary="$1"
    local label="$2"

    if command -v "$binary" >/dev/null 2>&1; then
        printf "✓ %-15s installed\n" "$label"
    else
        printf "✗ %-15s missing\n" "$label"
    fi
}

#
# Runtime
#

check_process waybar Waybar
check_process hyprpaper Hyprpaper
check_process swaync SwayNC

echo

#
# Installed
#

check_binary kitty Kitty
check_binary wofi Wofi
check_binary playerctl Playerctl
check_binary brightnessctl Brightnessctl
check_binary pamixer Pamixer
check_binary grim Grim
check_binary slurp Slurp
check_binary wl-copy wl-copy
