

{ config, lib, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./neovim.nix
    ./tmux.nix
  ];

  gitModule.enable = lib.mkDefault true;
  neovimModule.enable = lib.mkDefault true;
  tmuxModule.enable = lib.mkDefault true;
}