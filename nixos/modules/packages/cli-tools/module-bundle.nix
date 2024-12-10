

{ config, lib, pkgs, ... }:
{
  imports = [
    ./distrobox.nix
    ./git.nix
    ./neofetch.nix
    ./neovim.nix
  ];

  gitModule.enable = lib.mkDefault true;
  neofetchModule.enable = lib.mkDefault true;
  
  distroboxModule.enable = lib.mkDefault false;
}