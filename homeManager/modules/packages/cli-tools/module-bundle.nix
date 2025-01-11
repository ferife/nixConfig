

{ config, lib, pkgs, ... }:
{
  imports = [
    ./base16-schemes.nix
    ./bash.nix
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./lazygit.nix
    ./neovim.nix
    ./password-store.nix
    ./tmux.nix
    ./zoxide.nix
  ];

  base16SchemesModule.enable = lib.mkDefault true;
  bashModule.enable = lib.mkDefault true;
  fzfModule.enable = lib.mkDefault true;
  gitModule.enable = lib.mkDefault true;
  kittyModule.enable = lib.mkDefault true;
  lazygitModule.enable = lib.mkDefault true;
  neovimModule.enable = lib.mkDefault true;
  passModule.enable = lib.mkDefault true;
  tmuxModule.enable = lib.mkDefault true;
  zoxideModule.enable = lib.mkDefault true;
}
