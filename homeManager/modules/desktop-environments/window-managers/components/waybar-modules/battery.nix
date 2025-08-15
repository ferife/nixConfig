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
        "battery" = {
          states = {
            # good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          interval = 1;
          format-charging = "󰂄 {capacity}%";
          format-icons = [" " " " " " " " " "];
        };
      };
    };
  };
}
