

{ config, lib, pkgs, ... }:
{
  imports = [
    ./neovim.nix
    ./git.nix
    ./neofetch.nix
    ./distrobox.nix
  ];

  neovimModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  neofetchModule.enable = lib.mkDefault true;
  distroboxModule.enable = lib.mkDefault false;
}