{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  wifi-menu-path = "${config.hm.specialArgs.system-settings.scripts-dir}/rofi-wifi-menu.bash";
in {
  config = lib.mkIf config.hm.hyprland.waybar {
    home.file."${wifi-menu-path}" = {
      enable = true;
      source = ./shell-scripts/network-menu.bash;
    };
    programs.waybar = {
      settings.mainBar = {
        "network" = {
          format = "{ifname}";
          format-disconnected = "{icon}";
          format-wifi = "{essid} ({signalStrength}%) {icon}";
          tooltip = true;
          tooltip-format = "{ifname}";
          tooltip-format-wifi = "{ifname} ({bandwidthUpBytes} ) ({bandwidthDownBytes} )";
          format-icons = {
            wifi = "󰖩 ";
            disconnected = "󰖪 ";
          };
          on-click = "bash ~/${wifi-menu-path}";
        };
      };
    };
  };
}
