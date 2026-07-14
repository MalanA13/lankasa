#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

THEME="$1"

if [[ -z "$THEME" ]]; then
    echo "Usage:"
    echo "    lankasa new <theme>"
    exit 1
fi

TEMPLATE_DIR="$THEMES_DIR/_template"
THEME_DIR="$THEMES_DIR/$THEME"

ensure_dir "$TEMPLATE_DIR"

if [[ -d "$THEME_DIR" ]]; then
    log_error "Theme '$THEME' already exists."
    exit 1
fi

log_info "Creating theme '$THEME'..."

cp -r "$TEMPLATE_DIR" "$THEME_DIR"

MANIFEST="$THEME_DIR/theme.conf"

sed -i "s/^name=.*/name=\"${THEME^}\"/" "$MANIFEST"
sed -i "s/^id=.*/id=\"$THEME\"/" "$MANIFEST"

log_info "Theme created successfully."

echo
printf "Location:\n%s\n" "$THEME_DIR"
