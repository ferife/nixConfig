{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.waybar {
    hm.scripts.power-menu.enable = true;

    programs.waybar = {
      settings.mainBar = {
        "custom/power-menu" = {
          format = "<span size=\"xx-large\"> 󱄅 </span>";
          on-click = "bash ${config.hm.scripts.power-menu.true-path}";
          tooltip = false;
        };
      };
    };
  };
}
