{ config, lib, pkgs, ... }:
{
  imports = [
    ./general-settings.nix
  ];

  hyprland.settings.enable = lib.mkDefault true;
}
