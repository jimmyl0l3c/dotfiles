#!/usr/bin/env bash

hyprctl monitors -j | jq -c 'first(.[] | select(.model == "MSI G27CQ4 E2") | .activeWorkspace.id)'

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
  stdbuf -o0 awk -F '>>|,' -e '/^workspace>>/ && $2 >= 1 && $2 <= 5 {print $2}'
