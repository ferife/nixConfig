

{ config, lib, pkgs, ... }:
{
  imports = [
    ./distrobox.nix
    ./git.nix
    ./neofetch.nix
  ];

  gitModule.enable = lib.mkDefault true;
  neofetchModule.enable = lib.mkDefault true;
  
  distroboxModule.enable = lib.mkDefault false;
}