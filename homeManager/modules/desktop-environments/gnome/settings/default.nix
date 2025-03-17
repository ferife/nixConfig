{ config, lib, pkgs, ... }:
{
  imports = [
    ./options.nix

    ./general-settings.nix
    ./laptop-settings.nix
  ];

  hm.gnome = {
    generalSettings = lib.mkDefault config.hm.gnome.enable;
    laptopSettings  = lib.mkDefault config.hm.gnome.enable;
  };
}
