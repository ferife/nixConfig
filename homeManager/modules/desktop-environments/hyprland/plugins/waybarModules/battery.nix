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
        "battery" = {
          states = {
            # good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          interval = 1;
          format-charging = "{capacity}% 󰂄";
          format-icons = [" " " " " " " " " "];
        };
      };
    };
  };
}
