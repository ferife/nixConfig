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
        "custom/power-menu" = {
          format = " 󱄅 ";
          on-click = "bash $HOME/Documents/Scripts/rofi-scripts/power-menu.bash";
        };
        # TODO: Set up lock option (hyprlock)
        # TODO: Set up sleep option
        # TODO: Set up Log Out option
      };
    };
  };
}
