{ config, lib, pkgs, ... }:
{
  imports = [
    ./shells

    ./bat.nix
    ./bc.nix
    ./cmatrix.nix
    ./fzf.nix
    ./git.nix
    ./lsd.nix
    ./pandoc.nix
    ./password-store.nix
    ./starship.nix
    ./tldr.nix
    ./zoxide.nix
  ];

  bat.enable      = lib.mkDefault true;
  bc.enable       = lib.mkDefault true;
  cmatrix.enable  = lib.mkDefault true;
  fzf.enable      = lib.mkDefault true;
  git.hm.enable   = lib.mkDefault true;
  lsd.enable      = lib.mkDefault true;
  pandoc.enable   = lib.mkDefault false;
  pass.enable     = lib.mkDefault true;
  starship.enable = lib.mkDefault true;
  tldr.enable     = lib.mkDefault true;
  zoxide.enable   = lib.mkDefault true;
}
# TODO: Install Manix CLI docs searcher for nix
# Find documentation on Nixpkgs, NixOS options, and Home Manager options
