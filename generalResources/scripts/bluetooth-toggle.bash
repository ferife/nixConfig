#!/usr/bin/env bash

# This script toggles bluetooth

# Dependency checking
errorMessage=""
dependencies=(bluetooth bluetoothctl dunstify grep)
for item in "${dependencies[@]}"; do
  if ! type "$item" > /dev/null; then
    errorMessage="${errorMessage}ERROR: $item command not working\n"
  fi
done
if [[ -n "$errorMessage" ]]; then
  dunstify "ERROR: $0" "$errorMessage" || echo -e "ERROR: $0\n$errorMessage"
  exit 1
fi

if bluetooth | grep -q 'on'; then
  bluetoothctl power off
  dunstify --hints string:x-dunst-stack-tag:bluetooth-status "Bluetooth Disabled"
elif bluetooth | grep -q 'off'; then
  bluetoothctl power on
  dunstify --hints string:x-dunst-stack-tag:bluetooth-status "Bluetooth Enabled"
else
  dunstify "ERROR: Bluetooth Status" "Turning off bluetooth" || echo -e "ERROR: Bluetooth Status\nTurning off bluetooth"
  bluetoothctl power off
  exit 1
fi

# FIXME: Doesn't work
