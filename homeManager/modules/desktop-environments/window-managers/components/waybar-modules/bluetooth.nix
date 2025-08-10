{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.waybar {
    hm.scripts.bluetooth-toggle.enable = true;

    programs.waybar = {
      settings.mainBar = {
        "bluetooth" = {
          format-on = "<span size=\"x-large\">󰂯</span> enabled";
          format-off = "<span size=\"x-large\">󰂲</span> disabled";
          format-disabled = "<span size=\"x-large\">󰂲</span> disabled";
          format-connected = "<span size=\"x-large\">󰂱 </span>connected";
          on-click = "blueman-manager";
          # on-click-right = "bash ${config.hm.scripts.bluetooth-toggle.full-path}"; # FIXME
          tooltip = true;
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
          tooltip-format-enumerate-connected-battery = "{device_alias}: {device_battery_percentage}%";
        };
      };
    };
  };
}
