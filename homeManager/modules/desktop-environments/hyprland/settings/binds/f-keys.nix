{
  config,
  lib,
  pkgs,
  inputs,
  systemSettings,
  userSettings,
  ...
}: let
  brightness-mod-path = "${systemSettings.scriptsDirectory}/modify-monitor-brightness.bash";
in {
  config = lib.mkIf config.hm.hyprland.enable {
    hm.scripts.modify-volume.enable = true;

    home.packages = [
      pkgs.brightnessctl
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
          ", XF86AudioRaiseVolume, exec, ${config.hm.scripts.modify-volume.true-path} @DEFAULT_AUDIO_SINK@ ${toString config.hm.hyprland.max-volume} 5%+"

          # F3
          ", XF86AudioLowerVolume, exec, ${config.hm.scripts.modify-volume.true-path} @DEFAULT_AUDIO_SINK@ ${toString config.hm.hyprland.max-volume} 5%-"
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
