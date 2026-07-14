#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

THEME="$1"

if [[ -z "$THEME" ]]; then
    log_error "No theme specified."
    exit 1
fi

THEME_DIR="$THEMES_DIR/$THEME"
MANIFEST="$THEME_DIR/theme.conf"

ensure_dir "$THEME_DIR"
ensure_file "$MANIFEST"

load_theme "$THEME"

OUTPUT="$ROOT_DIR/config/colors.css"

cat > "$OUTPUT" <<EOF
@define-color accent $accent;
@define-color accent-bg $accent_bg;

@define-color bg $bg;
@define-color fg $fg;
@define-color text $text;

@define-color active-text $active_text;
EOF
log_info "Generated: $OUTPUT"
