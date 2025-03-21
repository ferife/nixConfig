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
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            "performance" = "󱐋";
            "balanced" = " ";
            "power-saver" = "󰌪 ";
          };
        };
      };
    };
  };
}
