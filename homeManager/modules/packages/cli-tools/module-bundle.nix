

{ config, lib, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./neovim.nix
  ];

  gitModule.enable = lib.mkDefault true;
  neovimModule.enable = lib.mkDefault true;
}