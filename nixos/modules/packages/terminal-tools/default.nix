{ config, lib, pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./distrobox.nix
    ./git.nix
    ./neofetch.nix
    ./neovim.nix
    ./nh.nix
  ];

  bashNixosModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  neofetchModule.enable = lib.mkDefault true;
  nh = {
    enable = lib.mkDefault true;
    autoClean = lib.mkDefault false;
  };

  distroboxModule.enable = lib.mkDefault false;
}
