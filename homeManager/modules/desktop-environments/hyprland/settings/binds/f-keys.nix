{
  config,
  lib,
  pkgs,
  inputs,
  systemSettings,
  ...
}: let
  brightness-mod-path = "${systemSettings.scriptsDirectory}/modify-monitor-brightness.bash";
in {
  config = lib.mkIf config.hm.hyprland.enable {
    home.packages = [
      pkgs.brightnessctl
      pkgs.bc
    ];

    home.file."${brightness-mod-path}" = {
      enable = true;
      source = ./shell-scripts/monitor-brightness.bash;
      executable = true;
    };

    wayland.windowManager.hyprland.settings = lib.mkMerge [
      # Format for a bindd with questions:
      # "MODS, key, description, dispatcher, params"
      # NOTE: Requires wireplumber to be enabled in nixos config
      {
        bind = [
          # F1
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" #F1
        ];
      }
      {
        binde = [
          # F2
          ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l ${toString (config.hm.hyprland.max-volume / 100.0)} @DEFAULT_AUDIO_SINK@ 5%+"

          # F3
          ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l ${toString (config.hm.hyprland.max-volume / 100.0)} @DEFAULT_AUDIO_SINK@ 5%-"
        ];
      }
      {
        binde = [
          # F7
          ", XF86MonBrightnessUp, exec, ~/${brightness-mod-path} intel_backlight 5%+"

          # F8
          ", XF86MonBrightnessDown, exec, ~/${brightness-mod-path} intel_backlight 5%-"
        ];
      }
    ];
  };
}
