#!/usr/bin/env bash

# This script is to be used in combination with rofi-wayland to open a power menu from my waybar

# Dependency checking
errorMessage=""
dependencies=(poweroff rofi reboot)
for item in "${dependencies[@]}"; do
  if ! type "$item" > /dev/null; then
    errorMessage="${errorMessage}ERROR: $item command not working\n"
  fi
done
if [[ -n "$errorMessage" ]]; then
  dunstify "ERROR: $0" "$errorMessage" || echo -e "ERROR: $0\n$errorMessage"
  exit 1
fi

chosen=$(printf "Power Off\nRestart\nCancel" | rofi -dmenu -i)

case "$chosen" in
  "Power Off")
    # shutdown now
    duntify "Powering Off"
    poweroff
    ;;
  "Restart")
    duntify "Restarting"
    reboot
    ;;
  "Cancel")
    exit 0
    ;;
  *)
    exit 1
    ;;
esac
