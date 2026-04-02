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
        "cpu" = {
          interval = 5;
          format = "<span size=\"x-large\">󰍛</span>";
          on-click = "ghostty -e btop";
          # TODO: Make on-click agnostic of terminal
        };
      };
    };
  };
}
