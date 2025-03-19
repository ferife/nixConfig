{ config, lib, pkgs, ... }:
{
  imports = [
    ./general-settings.nix
  ];

  nixos.hyprland.enable = lib.mkDefault true;
}
