{ config, lib, pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./distrobox.nix
    ./git.nix
    ./neofetch.nix
    ./nh.nix
  ];

  bash.nixos.enable = lib.mkDefault true;
  distrobox.enable = lib.mkDefault false;
  git.nixos.enable = lib.mkDefault true;
  neofetch.enable = lib.mkDefault true;
  nh = {
    enable = lib.mkDefault true;
    autoClean = lib.mkDefault false;
    shellAliases = lib.mkDefault true;
  };
}
