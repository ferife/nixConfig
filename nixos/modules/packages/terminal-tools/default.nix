{ config, lib, pkgs, ... }:
{
  imports = [
    ./shells

    ./distrobox.nix
    ./git.nix
    ./neofetch.nix
    ./nh.nix
  ];

  distrobox.enable = lib.mkDefault false;
  git.nixos.enable = lib.mkDefault true;
  neofetch.enable = lib.mkDefault true;
  nh = {
    enable = lib.mkDefault true;
    autoClean = lib.mkDefault false;
    shellAliases = lib.mkDefault true;
  };
}
