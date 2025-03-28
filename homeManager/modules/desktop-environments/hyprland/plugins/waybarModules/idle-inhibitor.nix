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
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰒳 ";
            deactivated = "󰒲 ";
          };
          tooltip = true;
          tooltip-format-activated = "{status}";
          tooltip-format-deactivated = "{status}";
          # on-click = "notify-send \"Idle inhibitor {status}\""; # FIXME
        };
      };
      style = ''${builtins.readFile ./idle-inhibitor.css}'';
    };
  };
}
