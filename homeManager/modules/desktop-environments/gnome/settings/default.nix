{ config, lib, pkgs, ... }:
{
  imports = [
    ./general-settings.nix
    ./laptop-settings.nix
  ];

  gnome = {
    generalSettings.enable = lib.mkDefault config.gnome.enable;
    laptopSettings.enable  = lib.mkDefault config.gnome.enable;
  };
}
