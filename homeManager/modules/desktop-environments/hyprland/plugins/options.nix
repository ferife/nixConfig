{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hm.hyprland.waybar = lib.mkEnableOption "Waybar, a highly customizable status bar for wayland window managers";
    hm.hyprland.wofi = lib.mkEnableOption "Wofi, an app launcher for wayland window managers";
  };
}
