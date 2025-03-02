{ config, lib, pkgs, ... }:
{
  imports = [
    ./general-settings.nix
  ];

  gnomeSettings.enable = lib.mkDefault true;
}
