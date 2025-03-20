{ config, lib, pkgs, ... }:
{
  imports = [
    ./general-settings.nix
    ./options.nix
  ];

  nixos.hyprland.enable = lib.mkDefault true;
}
