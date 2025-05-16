#!/usr/bin/env bash

PID_FILE="$HOME/.config/eww/idle_inhibit.pid"
EWW="/usr/bin/eww"

update_eww_state() {
    local state="$1"
    $EWW update idle_inhibit_state="$state"
}

check_inhibit() {
    if [ -f "$PID_FILE" ]; then
        pid=$(cat "$PID_FILE")
        if ps -p "$pid" > /dev/null 2>&1; then
            echo "active"
            return 0
        else
            rm -f "$PID_FILE"
            echo "inactive"
            return 1
        fi
    else
        echo "inactive"
        return 1
    fi
}

start_inhibit() {
    if ! check_inhibit > /dev/null; then
        systemd-inhibit --what=idle --who="EWW Idle Inhibit" --why="User toggled idle inhibition" sleep infinity & pid=$!
        echo "$pid" > "$PID_FILE"
        update_eww_state "active"
        echo "Idle inhibition started (PID: $pid)"
    else
        echo "Idle inhibition already active"
    fi
}

stop_inhibit() {
    if check_inhibit > /dev/null; then
        pid=$(cat "$PID_FILE")
        kill "$pid" 2>/dev/null
        rm -f "$PID_FILE"
        update_eww_state "inactive"
        echo "Idle inhibition stopped"
    else
        echo "No idle inhibition active"
    fi
}

toggle_inhibit() {
    if check_inhibit > /dev/null; then
        stop_inhibit
    else
        start_inhibit
    fi
}

case "$1" in
    "start")
        start_inhibit
        ;;
    "stop")
        stop_inhibit
        ;;
    "toggle")
        toggle_inhibit
        ;;
    "status")
        check_inhibit
        ;;
    *)
        echo "Usage: $0 {start|stop|toggle|status}"
        exit 1
        ;;
esac
