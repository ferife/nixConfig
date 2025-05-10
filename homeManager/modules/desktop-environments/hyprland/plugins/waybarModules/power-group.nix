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
        "group/power-group" = {
          orientation = "orthogonal";
          drawer = {
            transition-duration = 500;
            children-class = "not-power";
            transition-left-to-right = true; # transition from top to bottom
          };
          modules = [
            # "custom/power" # Group Leader
            # TODO: Fix strange styling with drawer options

            # "custom/lock"
            "custom/reboot"
            # "custom/quit"
          ];
        };
        "custom/power" = {
          format = "󰐥";
          tooltip = false;
          on-click = "shutdown now";
        };
        # "custom/lock" = {
        #   format = "";
        #   tooltip = false;
        #   on-click = ""; # TODO: Set up hyprlock
        # };
        # TODO: sleep option
        "custom/reboot" = {
          format = "";
          tooltip = false;
          on-click = "reboot";
        };
        "custom/quit" = {
          format = "󰈆";
          tooltip = false;
          on-click = "hyprctl dispatch exit";
        };
      };
      style = ''${builtins.readFile ./power-group.css}'';
    };
  };
}
