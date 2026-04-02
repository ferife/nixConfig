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
        "idle_inhibitor" = {
          format = "<span size=\"large\" >{icon}</span>";
          format-icons = {
            activated = "󰒳 ";
            deactivated = "󰒲 ";
          };
          tooltip = true;
          tooltip-format-activated = "{status}";
          tooltip-format-deactivated = "{status}";
          # on-click = "dunstify \"Idle inhibitor {status}\""; # FIXME
          # Look at the --hints flag for dustify for how to make this work
        };
      };
    };
  };
}
