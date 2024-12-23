

{ config, lib, pkgs, ... }:
{
  imports = [
    ./base16-schemes.nix
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./lazygit.nix
    ./neovim.nix
    ./tmux.nix
  ];

  base16SchemesModule.enable = lib.mkDefault true;
  fzfModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  kittyModule.enable = lib.mkDefault true;
  lazygitModule.enable = lib.mkDefault true;
  neovimModule.enable = lib.mkDefault true;
  tmuxModule.enable = lib.mkDefault true;
}
