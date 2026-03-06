{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    hm.playerctl = lib.mkForce true;
    hm.scripts = {
      modify-monitor-brightness.enable = true;
      modify-volume.enable = true;
    };

    # The names of the F-keys (based on function, not number) can be seen at https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h

    wayland.windowManager.hyprland.settings = let
      max-volume = toString config.hm.wm.max-volume;
      modify-monitor-brightness = config.hm.scripts.modify-monitor-brightness.full-path;
      modify-volume = config.hm.scripts.modify-volume.full-path;
    in
      lib.mkMerge [
        # Format for a bindd with questions:
        # "MODS, key, description, dispatcher, params"
        {
          bindd = [
            ", XF86AudioMute, Toggle mute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" #F1
          ];
        }
        {
          bindde = [
            ", XF86AudioRaiseVolume, Raise volume, exec, ${modify-volume} @DEFAULT_AUDIO_SINK@ ${max-volume} 5%+" # F2
            ", XF86AudioLowerVolume, Lower volume, exec, ${modify-volume} @DEFAULT_AUDIO_SINK@ ${max-volume} 5%-" # F3
          ];
        }
        {
          bindd = [
            ", XF86AudioPrev, Go to previous audio track, exec, playerctl previous" # F4
            ", XF86AudioPlay, Toggle play/pause of audio track, exec, playerctl play-pause" # F5
            ", XF86AudioNext, Go to next audio track, exec, playerctl next" # F6
          ];
        }
        {
          bindde = [
            ", XF86MonBrightnessUp, Increase brightness, exec, ${modify-monitor-brightness} intel_backlight 5%+" # F7
            ", XF86MonBrightnessDown, Decrease brightness, exec, ${modify-monitor-brightness} intel_backlight 5%-" # F8
          ];
        }
      ];
  };
}
