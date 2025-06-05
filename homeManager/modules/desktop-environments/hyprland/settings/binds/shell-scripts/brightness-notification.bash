#!/usr/bin/env bash

# This is to display a quick notification when setting the brightness, with the current brightness

device="$1"
percent=$(brightnessctl --device="$device" | grep -m 1 -Eo "[0-9]+%")
dunstify "Brightness" "$percent"
