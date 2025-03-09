#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-dialog.lock"
EWW_BIN="/usr/bin/eww"
DIALOG_CALLBACK="$1"

if [[ -f "$LOCK_FILE" ]]; then
    ${EWW_BIN} -c $HOME/.config/eww close confirm_dialog
else
    touch "$LOCK_FILE"
fi

eww update dialog_callback="$DIALOG_CALLBACK"
${EWW_BIN} -c $HOME/.config/eww open confirm_dialog
