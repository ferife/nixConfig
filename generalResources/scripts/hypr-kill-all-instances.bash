#!/usr/bin/env bash

# This script is used in hyprland to kill all instances of the app of the currently active window

# Dependency checking
errorMessage=""
dependencies=(awk grep hyprctl tr)
for item in "${dependencies[@]}"; do
  if ! type "$item" > /dev/null; then
    errorMessage="${errorMessage}ERROR: $item command not working\n"
  fi
done
if [[ -n "$errorMessage" ]]; then
  dunstify "ERROR: $0" "$errorMessage" || echo -e "ERROR: $0\n$errorMessage"
  exit 1
fi

active_window_class=$(hyprctl activewindow | grep "class" | awk '{print $NF}')
echo "Class: ($active_window_class)"

window_list=$(hyprctl clients | tr -d "\t" | grep -E "^pid|^class" | awk '{print $NF}')

# Example of how it will come out for a single window
# class (str)
# PID (int)

cur_line="class"
kill_this="no"
echo "$window_list" | while read line; do
  if [[ $cur_line == "class" ]]; then
    cur_line="pid"
    if [[ "$line" == "$active_window_class" ]]; then
      kill_this="yes"
    else
      kill_this="no"
    fi
  else
    cur_line="class"
    if [[ "$kill_this" == "yes" ]]; then
      hyprctl dispatch killwindow pid:"$line"
    fi
  fi
done
