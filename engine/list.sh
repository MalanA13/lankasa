#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

ensure_dir "$THEMES_DIR"

log_info "Installed themes"

echo

for dir in "$THEMES_DIR"/*; do
    [[ -d "$dir" ]] || continue

    theme="$(basename "$dir")"
    [[ "$theme" == "_template" ]] && continue

    load_theme "$theme"

    printf "● %s\n" "$name"
    printf "  ID       %s\n" "$id"
    printf "  Version  %s\n" "$version"
    printf "  Accent   %s\n\n" "$accent"
done
