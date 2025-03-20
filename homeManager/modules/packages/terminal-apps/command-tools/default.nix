{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix
    ./shells

    ./alejandra.nix
    ./bat.nix
    ./bc.nix
    ./cmatrix.nix
    ./eza.nix
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
    alejandra = lib.mkDefault true;
    bat = lib.mkDefault true;
    bc = lib.mkDefault true;
    cmatrix = lib.mkDefault true;
    eza = lib.mkDefault true;
    fastfetch = lib.mkDefault true;
    fzf = lib.mkDefault true;
    git = lib.mkDefault true;
    lsd = false;
    neofetch = false;
    pandoc = false;
    pass = lib.mkDefault true;
    starship = lib.mkDefault true;
    tldr = lib.mkDefault true;
    zoxide = lib.mkDefault true;
  };
}
# TODO: Install Manix CLI docs searcher for nix
# Find documentation on Nixpkgs, NixOS options, and Home Manager options

