#!/usr/bin/env bash

# This script is to be used in combination with rofi-wayland to open a power menu from my waybar

# TODO: Set up lock option (hyprlock)
# TODO: Set up sleep option

if ! type reboot > /dev/null; then
  errorMessage="${errorMessage}ERROR: reboot command not working\n"
fi
if ! type rofi > /dev/null; then
  errorMessage="${errorMessage}ERROR: rofi command not working\n"
fi
if ! type shutdown > /dev/null; then
  errorMessage="${errorMessage}ERROR: shutdown command not working\n"
fi
if [[ -n "$errorMessage" ]]; then
  dunstify "ERROR: $0" "$errorMessage" || echo -e "ERROR: $0\n$errorMessage"
  exit 1
fi

chosen=$(printf "Shut down\nReboot\nCancel" | rofi -dmenu -i)

case "$chosen" in
  "Shut Down")
    shutdown now
    ;;
  "Reboot")
    reboot
    ;;
  "Cancel")
    exit 0
    ;;
  *)
    exit 1
    ;;
esac
