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
        "group/battery-group" = {
          orientation = "horizontal";
          modules = [
            "power-profiles-daemon"
            "battery"
          ];
        };
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
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            "performance" = "󱐋";
            "balanced" = "󱦟";
            "power-saver" = "󰔱";
          };
        };
      };
      style = ''${builtins.readFile ./battery-group.css}'';
    };
  };
}
