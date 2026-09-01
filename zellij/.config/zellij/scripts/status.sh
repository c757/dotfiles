#!/usr/bin/env bash

case "${1:-}" in
session)
    printf '%s' "${ZELLIJ_SESSION_NAME:-zellij}"
    ;;

cpu)
    cores="$(sysctl -n hw.ncpu)"
    cpu="$(ps -A -o %cpu= | awk '{ total += $1 } END { printf "%.0f", total }')"
    awk -v cpu="$cpu" -v cores="$cores" 'BEGIN { printf "%.0f%%", cpu / cores }'
    ;;

memory)
    free="$(memory_pressure -Q | awk -F': ' '/System-wide memory free percentage/ {
        gsub(/%/, "", $2)
        print $2
        exit
    }')"
    awk -v free="$free" 'BEGIN { printf "%.0f%%", 100 - free }'
    ;;

battery)
    battery="$(pmset -g batt | awk 'NR == 2 {
        match($0, /[0-9]+%/)
        print substr($0, RSTART, RLENGTH)
        exit
    }')"

    if [[ -z "$battery" ]]; then
        printf 'AC'
    elif pmset -g batt | grep -q "AC Power"; then
        printf '%s AC' "$battery"
    else
        printf '%s' "$battery"
    fi
    ;;

uptime)
    text="$(uptime)"

    if [[ "$text" =~ up[[:space:]]+([0-9]+)[[:space:]]+days? ]]; then
        printf '%sd' "${BASH_REMATCH[1]}"
    elif [[ "$text" =~ up[[:space:]]+([0-9]+): ]]; then
        printf '%sh' "${BASH_REMATCH[1]}"
    elif [[ "$text" =~ up[[:space:]]+([0-9]+)[[:space:]]+mins? ]]; then
        printf '%sm' "${BASH_REMATCH[1]}"
    else
        printf 'up'
    fi
    ;;

*)
    exit 64
    ;;
esac
