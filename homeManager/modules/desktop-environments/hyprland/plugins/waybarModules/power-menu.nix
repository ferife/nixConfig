{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  power-menu-path = ".nix-scripts/rofi-power-menu.bash";
in {
  config = lib.mkIf config.hm.hyprland.waybar {
    home.file.${power-menu-path} = {
      enable = true;
      source = ./shell-scripts/power-menu.bash;
    };
    programs.waybar = {
      settings.mainBar = {
        "custom/power-menu" = {
          format = " 󱄅 ";
          on-click = "bash ~/${power-menu-path}";
        };
        # TODO: Set up lock option (hyprlock)
        # TODO: Set up sleep option
        # TODO: Set up Log Out option
      };
    };
  };
}
