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
          # TODO: custom/weather (use wttrbar package)
        };
      };
    };
  };
}
