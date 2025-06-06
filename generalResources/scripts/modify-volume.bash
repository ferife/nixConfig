#!/usr/bin/env bash

# This script will be used to modify the device's current volume
# This will trigger a sound, but with a cooldown
# If the script is triggered again within the cooldown, the cooldown resets

# wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l ${toString (config.hm.hyprland.max-volume / 100.0)} @DEFAULT_AUDIO_SINK@ 5%+

# Format for calling this
# scriptName audioSink maxVolume volumeMod
# scriptName.bash "@DEFAULT_AUDIO_SINK@" 150 5%+

# Set initial variables
# if [[ -z "$sound_file" ]]; then
#   sound_file="$HM_CONFIG_ASSETS_DIR/volume-test.mp3"
# fi
lock_file="/tmp/volume-notif-sound.lock"
cooldown_ms=250

# Dependency checking
errorMessage=""
if [[ -z "$sound_file" ]]; then
  errorMessage="${errorMessage}ERROR: Sound file not found\n"
fi
if [[ "$#" != 3 ]]; then
  errorMessage="${errorMessage}ERROR: Incorrect number of arguments\n"
fi
if ! type bc > /dev/null; then
  errorMessage="${errorMessage}ERROR: bc not installed\n"
fi
if ! type date > /dev/null; then
  errorMessage="${errorMessage}ERROR: date not installed\n"
fi
if ! type pw-play > /dev/null; then
  errorMessage="${errorMessage}ERROR: pw-play command does not exist (ensure pipewire and wireplumber are installed)\n"
fi
if ! type wpctl > /dev/null; then
  errorMessage="${errorMessage}ERROR: wpctl command does not exist (ensure pipewire and wireplumber are installed)\n"
fi
if ! type wpctl > /dev/null; then
  errorMessage="${errorMessage}ERROR: wpctl command does not exist (ensure pipewire and wireplumber are installed)\n"
fi
if [[ -n "$errorMessage" ]]; then
  dunstify "ERROR: $0" "$errorMessage"
  exit 1
fi

audioSink="$1"
maxVolume="$2"
volumeMod="$3"

wpctl set-mute "$audioSink" 0 || exit 1
wpctl set-volume -l "$(bc <<< "scale=2; $maxVolume / 100")" "$audioSink" "$volumeMod" || exit 1

cooldown_sec=$(bc <<< "scale=3; $cooldown_ms / 1000")
current_time=$(($(date +%s%N)/1000000)) # In milliseconds

echo "$current_time" > "$lock_file"
sleep "$cooldown_sec"

lock_time=$(< "$lock_file")

if [[ "$lock_time" == "$current_time" ]]; then
  errorMessage=$(pw-play "$sound_file" --target="$audioSink" --volume=1.0 2>&1)
  if [[ -n "$errorMessage" ]]; then
    dunstify "ERROR: $0" "$errorMessage"
  fi
  rm -f "$lock_file"
fi

exit 0
