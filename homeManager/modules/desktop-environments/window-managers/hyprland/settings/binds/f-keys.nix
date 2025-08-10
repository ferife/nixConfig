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
          bind = [
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" #F1
          ];
        }
        {
          binde = [
            ", XF86AudioRaiseVolume, exec, ${modify-volume} @DEFAULT_AUDIO_SINK@ ${max-volume} 5%+" # F2
            ", XF86AudioLowerVolume, exec, ${modify-volume} @DEFAULT_AUDIO_SINK@ ${max-volume} 5%-" # F3
          ];
        }
        {
          bind = [
            ", XF86AudioPrev, exec, playerctl previous" # F4
            ", XF86AudioPlay, exec, playerctl play-pause" # F5
            ", XF86AudioNext, exec, playerctl next" # F6
          ];
        }
        {
          binde = [
            ", XF86MonBrightnessUp, exec, ${modify-monitor-brightness} intel_backlight 5%+" # F7
            ", XF86MonBrightnessDown, exec, ${modify-monitor-brightness} intel_backlight 5%-" # F8
          ];
        }
      ];
  };
}
