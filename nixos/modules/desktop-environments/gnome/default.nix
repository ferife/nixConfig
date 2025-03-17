{ config, lib, pkgs, ... }:
{
  imports = [
    ./options.nix

    ./gdm-settings.nix
    ./general-settings.nix
  ];

  nixos.gnome = {
    enable = lib.mkDefault true;
    gdmSettings = lib.mkDefault true;
  };
}
