{ config, lib, pkgs, ... }:
{
  imports = [
    ./settings
  ];

  options = {
    hm.hyprland.generalSettings.enable = lib.mkEnableOption "Enable some basic settings for GNOME";
  };
}
