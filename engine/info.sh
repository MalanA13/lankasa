#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

THEME="$1"

if [[ -z "$THEME" ]]; then
    log_error "No theme specified."
    exit 1
fi

load_theme "$THEME"

echo "Theme Information"
echo
printf "%-12s %s\n" "Name" "$name"
printf "%-12s %s\n" "ID" "$id"
printf "%-12s %s\n" "Version" "$version"
printf "%-12s %s\n" "Author" "$author"
echo
echo "Description"
echo "$description"
echo
printf "%-12s %s\n" "Wallpaper" "$(basename "$wallpaper")"
printf "%-12s %s\n" "Accent" "$accent"
echo
echo "Requirements"

IFS=',' read -ra deps <<< "$requires"

for dep in "${deps[@]}"; do
    printf "  • %s\n" "$dep"
done
