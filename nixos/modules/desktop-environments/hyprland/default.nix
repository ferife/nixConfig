{ config, lib, pkgs, ... }:
{
  imports = [
    ./options.nix

    ./hyprland.nix
  ];

  nixos.hyprland.enable = lib.mkDefault true;
}
