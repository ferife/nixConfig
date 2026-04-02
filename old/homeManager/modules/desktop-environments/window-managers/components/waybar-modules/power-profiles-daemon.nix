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
        # This module is unnecessary if using TLP instead of the power profiles daemon
        "power-profiles-daemon" = {
          format = "<span size=\"large\" >{icon}</span> Test";
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
