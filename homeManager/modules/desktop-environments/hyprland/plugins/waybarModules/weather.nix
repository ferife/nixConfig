{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.waybar {
    programs.waybar = {
      settings.mainBar = {
        "custom/weather" = {
          # TODO: custom/weather (use wttrbar package)
        };
      };
      # style = ''${builtins.readFile ./battery-group.css}'';
    };
  };
}
