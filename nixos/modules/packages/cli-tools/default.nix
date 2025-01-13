

{ config, lib, pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./distrobox.nix
    ./git.nix
    ./neofetch.nix
    ./neovim.nix
    ./password-store.nix
  ];

  bashNixosModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  neofetchModule.enable = lib.mkDefault true;
  passNixosModule.enable = lib.mkDefault true;
  
  distroboxModule.enable = lib.mkDefault false;
}
