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
          format = "{icon} {capacity}%";
          interval = 1;
          format-charging = "󰂄 {capacity}%";
          format-icons = [" " " " " " " " " "];
        };
        "power-profiles-daemon" = {
          format = "<span size=\"large\" >{icon}</span>";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            "performance" = " 󱐋 ";
            "balanced" = " 󱦟 ";
            "power-saver" = " 󰔱 ";
          };
        };
      };
    };
  };
}
