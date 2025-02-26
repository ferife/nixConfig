{ config, lib, pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./bat.nix
    ./bc.nix
    ./cmatrix.nix
    ./fzf.nix
    ./git.nix
    ./lsd.nix
    ./pandoc.nix
    ./password-store.nix
    ./tldr.nix
    ./zoxide.nix
  ];

  bashModule.enable   = lib.mkDefault true;
  batModule.enable    = lib.mkDefault true;
  bcModule.enable     = lib.mkDefault true;
  cmatrix.enable      = lib.mkDefault true;
  fzfModule.enable    = lib.mkDefault true;
  gitModule.enable    = lib.mkDefault true;
  lsdModule.enable    = lib.mkDefault true;
  passModule.enable   = lib.mkDefault true;
  tldrModule.enable   = lib.mkDefault true;
  zoxideModule.enable = lib.mkDefault true;

  pandocModule.enable = lib.mkDefault false;
}
# TODO: Install Manix CLI docs searcher for nix
# Find documentation on Nixpkgs, NixOS options, and Home Manager options
