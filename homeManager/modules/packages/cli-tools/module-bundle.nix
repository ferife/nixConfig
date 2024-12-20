

{ config, lib, pkgs, ... }:
{
  imports = [
    ./fzf.nix
    ./git.nix
    ./frf-gnome-terminal.nix
    ./neovim.nix
    ./tmux.nix
  ];

  fzfModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  gnomeTerminalModule.enable = lib.mkDefault true;
  neovimModule.enable = lib.mkDefault true;
  tmuxModule.enable = lib.mkDefault true;
}
