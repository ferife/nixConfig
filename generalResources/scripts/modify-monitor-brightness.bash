#!/usr/bin/env bash

# This script is to be used to raise/lower screen brightness and show a notification with the current brightness

# format SCRIPT_NAME DEVICE_NAME CHANGE

# Dependency checking
errorMessage=""
dependencies=(bc brightnessctl dunstify grep)
for item in "${dependencies[@]}"; do
  if ! type "$item" > /dev/null; then
    errorMessage="${errorMessage}ERROR: $item command not working\n"
  fi
done
if [[ -n "$errorMessage" ]]; then
  dunstify "ERROR: $0" "$errorMessage" || echo -e "ERROR: $0\n$errorMessage"
  exit 1
fi

device="$1"
change="$2"

current_state=$(brightnessctl --device="$device")

current_brightness=$(echo "$current_state" | grep -oP 'Current brightness: \K\d+')
max_brightness=$(echo "$current_state" | grep -oP 'Max brightness: \K\d+')
max_percent=100

min_percent=5 # NOTE: CHANGE HERE

min_brightness=$(echo "scale=2; $min_percent / 100 * $max_brightness" | bc)
min_brightness=$(echo "scale=0; $min_brightness / 1" | bc)

function parse_change {
  local input=$1

  if [[ "$input" =~ ^([+]?[0-9]+%?[+-]?|[+]?[0-9]+%?)$ ]] &&
      ! [[ "$input" =~ [%].*[%] ]] &&
      ! [[ "$input" =~ ^[+-].*[+-]$ ]]; then

  local number=$(echo "$input" | tr -d "+%-")
  echo -n "$number "

    [[ "$input" =~ % ]] && echo -n "percent "

    if [[ "$input" =~ ^\+ ]] || [[ "$input" =~ \+$ ]]; then
      echo "add"
    elif [[ "$input" =~ ^- ]] || [[ "$input" =~ -$ ]]; then
      echo "subtract"
    else
      echo "set"
    fi

  else
    echo "ERROR: invalid input"
    exit 1
  fi
}

change_formatted=$(parse_change "$change")

read -ra change_parts <<< "$change_formatted"

change_number="${change_parts[0]}"

change_percent=""
if [[ "${change_parts[1]}" = "percent" ]]; then
  change_percent="$change_number"
fi

change_operation="${change_parts[-1]}"

if [[ -n "$change_percent" ]]; then
  change_brightness=$(echo "scale=2; $change_number / 100 * $max_brightness" | bc)
  change_brightness=$(echo "scale=0; $change_brightness / 1" | bc)
else
  change_brightness="$change_number"
  change_percent=$(echo "scale=2; $change_number / $max_brightness * 100" | bc)
  change_percent=$(echo "scale=0; $change_percent / 1" | bc)
fi

after_brightness=""
after_percent=""

notif_body=""

if [[ "$change_operation" == "add" ]]; then
  after_brightness=$(echo "scale=0; $current_brightness + $change_brightness" | bc)
  after_percent=$(echo "scale=2; $after_brightness / $max_brightness * 100" | bc)
  after_percent=$(echo "scale=0; $after_percent / 1" | bc)
elif [[ "$change_operation" == "subtract" ]]; then
  after_brightness=$(echo "scale=0; $current_brightness - $change_brightness" | bc)
  after_percent=$(echo "scale=2; $after_brightness / $max_brightness * 100" | bc)
  after_percent=$(echo "scale=0; $after_percent / 1" | bc)
else # set
  after_brightness="$change_brightness"
  after_percent="$change_percent"
fi

if (( "$after_brightness" < "$min_brightness" )); then
  notif_body="The brightness you've set is too low\n"
  after_brightness="$min_brightness"
  after_percent="$min_percent"
elif (( "$after_brightness" > "$max_brightness" )); then
  notif_body="The brightness you've set is too high\n"
  after_brightness="$max_brightness"
  after_percent="$max_percent"
fi

if [[ -n "$notif_body" ]]; then
  notif_body="${notif_body}Brightness is now "
fi
notif_body="${notif_body}$after_brightness ($after_percent%)"

brightnessctl set "$after_brightness" --device="$device" --quiet
dunstify --hints string:x-dunst-stack-tag:brightness "Brightness" "$notif_body"
