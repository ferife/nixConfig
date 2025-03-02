{ config, lib, pkgs, ... }:
{
  imports = [
    ./extensions
    ./settings
  ];

  options = {
    gnome.enable = lib.mkEnableOption "GNOME, the Desktop Environment";
  };
}
