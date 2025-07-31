{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.waybar {
    programs.waybar = {
      settings.mainBar = {
        "custom/weather" = {
          # custom/weather (use wttrbar package)
        };
      };
    };
  };
}
