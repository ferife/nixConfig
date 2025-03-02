{ config, lib, pkgs, ... }:
{
  imports = [
    ./general-settings.nix
  ];

  gnome.settings.enable = lib.mkDefault true;
}
