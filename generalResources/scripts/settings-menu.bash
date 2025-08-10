#!/usr/bin/env bash

# This script is to be used in combination with rofi-wayland to open a settings menu from my waybar

# Dependency checking
errorMessage=""
dependencies=(blueman-manager dunstify rofi)
for item in "${dependencies[@]}"; do
  if ! type "$item" > /dev/null; then
    errorMessage="${errorMessage}ERROR: $item command not working\n"
  fi
done
if [[ -n "$errorMessage" ]]; then
  dunstify "ERROR: $0" "$errorMessage" || echo -e "ERROR: $0\n$errorMessage"
  exit 1
fi

chosen=$(printf "Bluetooth Settings\nCancel" | rofi -dmenu -i)

case "$chosen" in
  "Bluetooth Settings")
    blueman-manager
    ;;
  "Cancel")
    exit 0
    ;;
  *)
    exit 1
    ;;
esac
