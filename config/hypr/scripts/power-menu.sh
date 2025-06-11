#!/usr/bin/env bash

# Options for rofi menu
options="Shutdown\nRestart\nSuspend\nLogout"

# Show the rofi menu
choice=$(echo -e "$options" | rofi -dmenu -theme-str 'window { width: 550px; } listview { columns: 4; lines: 1; } element-text { horizontal-align: 0.50; } configuration { show-icons: false; } inputbar { enabled: false; }')

case "$choice" in
    Shutdown)
        systemctl poweroff
        ;;
    Restart)
        systemctl reboot
        ;;
    Suspend)
        systemctl suspend
        ;;
    Logout)
        uwsm stop
        ;;
    *)
        # Do nothing on invalid or no selection
        ;;
esac