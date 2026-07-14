#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

THEMES_DIR="$ROOT_DIR/themes"
STATE_DIR="$HOME/.config/lankasa/state"

CURRENT_THEME_FILE="$STATE_DIR/current-theme"

log_info() {
    printf "\033[1;34m[INFO]\033[0m %s\n" "$1"
}

log_warn() {
    printf "\033[1;33m[WARN]\033[0m %s\n" "$1"
}

log_error() {
    printf "\033[1;31m[ERROR]\033[0m %s\n" "$1"
}

ensure_file() {
    if [[ ! -f "$1" ]]; then
        log_error "Missing file: $1"
        exit 1
    fi
}

ensure_dir() {
    if [[ ! -d "$1" ]]; then
        log_error "Missing directory: $1"
        exit 1
    fi
}
