

{ config, lib, pkgs, ... }:
{
  imports = [
    ./base16-schemes.nix
    ./bash.nix
    ./bat.nix
    ./btop.nix
    ./dust.nix
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./lazygit.nix
    ./lsd.nix
    ./neovim.nix
    ./password-store.nix
    ./ranger.nix
    ./tldr.nix
    ./tmux.nix
    ./zoxide.nix
  ];

  base16SchemesModule.enable = lib.mkDefault true;
  bashModule.enable = lib.mkDefault true;
  batModule.enable = lib.mkDefault true;
  btopModule.enable = lib.mkDefault true;
  dustModule.enable = lib.mkDefault true;
  fzfModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  kittyModule.enable = lib.mkDefault true;
  lazygitModule.enable = lib.mkDefault true;
  lsdModule.enable = lib.mkDefault true;
  neovimModule.enable = lib.mkDefault true;
  passModule.enable = lib.mkDefault true;
  rangerModule.enable = lib.mkDefault true;
  tldrModule.enable = lib.mkDefault true;
  tmuxModule.enable = lib.mkDefault true;
  zoxideModule.enable = lib.mkDefault true;
}
