{ config, lib, pkgs, ... }:
{
  imports = [
    ./settings
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "Hyprland, the window manager";
  };
}
