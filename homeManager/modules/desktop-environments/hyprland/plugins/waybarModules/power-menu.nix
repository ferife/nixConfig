{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  power-menu-path = "${config.hm.specialArgs.system-settings.scripts-dir}/rofi-power-menu.bash";
in {
  config = lib.mkIf config.hm.hyprland.waybar {
    home.file.${power-menu-path} = {
      enable = true;
      source = ./shell-scripts/power-menu.bash;
    };
    programs.waybar = {
      settings.mainBar = {
        "custom/power-menu" = {
          format = "<span size=\"xx-large\"> 󱄅 </span>";
          on-click = "bash ~/${power-menu-path}";
          tooltip = false;
        };
        # TODO: Set up lock option (hyprlock)
        # TODO: Set up sleep option
        # TODO: Set up Log Out option
      };
    };
  };
}
