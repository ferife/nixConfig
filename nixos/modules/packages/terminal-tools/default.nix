{ config, lib, pkgs, ... }:
{
  imports = [
    ./shells

    ./distrobox.nix
    ./fastfetch.nix
    ./git.nix
    ./neofetch.nix
    ./nh.nix
  ];

  distrobox.enable       = lib.mkDefault false;
  fastfetch.nixos.enable = lib.mkDefault true;
  git.nixos.enable       = lib.mkDefault true;
  neofetch.nixos.enable  = lib.mkDefault false;
  nh = {
    enable = lib.mkDefault true;
    autoClean = lib.mkDefault false;
    shellAliases = lib.mkDefault true;
  };
}
