#!/usr/bin/env bash

hyprctl devices -j | jq '."keyboards"[] | select(."main" == true).active_keymap' | sed 's/"//g'

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
  stdbuf -o0 awk -F '>>|,' -e '/^activelayout>>/ {print $3}'
