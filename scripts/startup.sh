#!/usr/bin/env bash

# ===========================================
# LANKASA STARTUP
# ===========================================

# beri waktu compositor selesai init
sleep 1

start() {
    if ! pgrep -x "$1" >/dev/null; then
        "$@" &
    fi
}

start hyprpaper
start waybar
start hypridle
