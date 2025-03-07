{ config, lib, pkgs, ... }:
{
  imports = [
    ./gdm-settings.nix
    ./general-settings.nix
  ];

  gdmSettings.enable    = lib.mkDefault true;
  gnome.settings.enable = lib.mkDefault true;
}
