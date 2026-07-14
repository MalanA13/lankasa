#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

log_info "Reloading Waybar..."

pkill waybar 2>/dev/null
waybar >/dev/null 2>&1 &

log_info "Reload complete."
