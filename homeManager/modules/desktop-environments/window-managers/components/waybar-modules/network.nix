{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.waybar {
    hm.scripts.network-menu.enable = true;

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
          on-click = "bash ${config.hm.scripts.network-menu.true-path}";
        };
      };
    };
  };
}
