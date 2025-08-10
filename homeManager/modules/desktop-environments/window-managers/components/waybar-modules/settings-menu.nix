{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.waybar {
    hm.scripts.settings-menu.enable = true;

    programs.waybar = {
      settings.mainBar = {
        "custom/settings-menu" = {
          format = "<span size=\"x-large\">   </span>";
          on-click = "bash ${config.hm.scripts.settings-menu.full-path}";
          tooltip = false;
        };
      };
    };
  };
}
