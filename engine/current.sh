#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

ensure_file "$CURRENT_THEME_FILE"

CURRENT="$(cat "$CURRENT_THEME_FILE")"

log_info "Current theme: $CURRENT"
