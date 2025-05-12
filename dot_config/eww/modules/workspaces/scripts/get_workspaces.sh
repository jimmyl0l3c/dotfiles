#!/usr/bin/env bash

MIN_ID="${1:-1}"
MAX_ID="${2:-10}"

spaces (){
    ACTIVE_WORKSPACES=$(hyprctl monitors -j | jq -Mc 'map({key: .activeWorkspace.id | tostring, value: true}) | from_entries')
	WORKSPACE_WINDOWS=$(hyprctl workspaces -j | jq 'map({key: .id | tostring, value: .windows}) | from_entries')
	seq $MIN_ID $MAX_ID | jq --argjson windows "${WORKSPACE_WINDOWS}" --argjson monitors "${ACTIVE_WORKSPACES}" --slurp -Mc 'map(tostring) | map({id: ., windows: ($windows[.]//0), is_active: ($monitors[.]//false)})'
}

spaces
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
	spaces
done
