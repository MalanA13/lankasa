#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"

THEME="$1"

if [[ -z "$THEME" ]]; then
    log_error "No theme specified."
    exit 1
fi

log_info "Applying theme: $THEME"

"$SCRIPT_DIR/validate.sh" "$THEME" || exit 1

"$SCRIPT_DIR/generate-colors.sh" "$THEME" || exit 1

mkdir -p "$STATE_DIR"
echo "$THEME" > "$CURRENT_THEME_FILE"

"$SCRIPT_DIR/load-components.sh" "$THEME" || exit 1

"$SCRIPT_DIR/reload.sh" || exit 1

log_info "Theme applied successfully."
