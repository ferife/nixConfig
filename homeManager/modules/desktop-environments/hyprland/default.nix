{ config, lib, pkgs, ... }:
{
  imports = [
    ./options.nix

    ./plugins
    ./hyprland.nix
  ];
}
