#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-dialog.lock"
EWW_BIN="/usr/bin/eww"

eww update dialog_callback=""

# Open widgets
if [[ -f "$LOCK_FILE" ]]; then
    ${EWW_BIN} -c $HOME/.config/eww close confirm_dialog
    rm "$LOCK_FILE" && echo "closed"
fi
