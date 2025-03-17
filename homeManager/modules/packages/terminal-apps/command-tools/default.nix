{ config, lib, pkgs, ... }:
{
  imports = [
    ./options.nix
    ./shells

    ./bat.nix
    ./bc.nix
    ./cmatrix.nix
    ./fastfetch.nix
    ./fzf.nix
    ./git.nix
    ./lsd.nix
    ./neofetch.nix
    ./pandoc.nix
    ./password-store.nix
    ./starship.nix
    ./tldr.nix
    ./zoxide.nix
  ];

  hm = {
    bat       = lib.mkDefault true;
    bc        = lib.mkDefault true;
    cmatrix   = lib.mkDefault true;
    fastfetch = lib.mkDefault true;
    fzf       = lib.mkDefault true;
    git       = lib.mkDefault true;
    lsd       = lib.mkDefault true;
    neofetch  = lib.mkDefault false;
    pandoc    = lib.mkDefault false;
    pass      = lib.mkDefault true;
    starship  = lib.mkDefault true;
    tldr      = lib.mkDefault true;
    zoxide    = lib.mkDefault true;
  };
}
# TODO: Install Manix CLI docs searcher for nix
# Find documentation on Nixpkgs, NixOS options, and Home Manager options
