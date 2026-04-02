{
  config,
  lib,
  pkgs,
  ...
}: {
  options.hm.wm.hyprland.enable = lib.mkEnableOption "Hyprland, the window manager";
}
