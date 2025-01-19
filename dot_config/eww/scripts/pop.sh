#!/bin/bash

calendar() {
LOCK_FILE="$HOME/.cache/eww-calendar.lock"
# EWW_BIN="$HOME/.local/bin/eww/eww"
EWW_BIN="/usr/bin/eww"

run() {
    ${EWW_BIN} -c $HOME/.config/eww open calendar
}

# Open widgets
if [[ ! -f "$LOCK_FILE" ]]; then
    # ${EWW_BIN} -c $HOME/.config/eww close system music_win audio_ctl
    touch "$LOCK_FILE"
    run && echo "ok good!"
else
    ${EWW_BIN} -c $HOME/.config/eww close calendar
    rm "$LOCK_FILE" && echo "closed"
fi
}

if [ "$1" = "calendar" ]; then
calendar
fi
