{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hm.hyprland.waybar = lib.mkEnableOption "Waybar, a highly customizable status bar for wayland window managers";
  };
}
