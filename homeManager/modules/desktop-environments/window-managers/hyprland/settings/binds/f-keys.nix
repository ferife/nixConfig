{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    hm.scripts = {
      modify-monitor-brightness.enable = true;
      modify-volume.enable = true;
    };

    # The names of the F-keys (based on function, not number) can be seen at https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h

    wayland.windowManager.hyprland.settings = lib.mkMerge [
      # Format for a bindd with questions:
      # "MODS, key, description, dispatcher, params"
      {
        bind = [
          # F1
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" #F1
        ];
      }
      {
        binde = [
          # F2
          ", XF86AudioRaiseVolume, exec, ${config.hm.scripts.modify-volume.true-path} @DEFAULT_AUDIO_SINK@ ${toString config.hm.wm.max-volume} 5%+"

          # F3
          ", XF86AudioLowerVolume, exec, ${config.hm.scripts.modify-volume.true-path} @DEFAULT_AUDIO_SINK@ ${toString config.hm.wm.max-volume} 5%-"
        ];
      }
      {
        binde = [
          # F7
          ", XF86MonBrightnessUp, exec, ${config.hm.scripts.modify-monitor-brightness.true-path} intel_backlight 5%+"

          # F8
          ", XF86MonBrightnessDown, exec, ${config.hm.scripts.modify-monitor-brightness.true-path} intel_backlight 5%-"
        ];
      }
    ];
  };
}
