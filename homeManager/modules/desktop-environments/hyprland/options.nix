{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hm.hyprland.enable = lib.mkEnableOption "Hyprland, the window manager";
  };
}
