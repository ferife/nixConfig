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
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./lsd.nix
    ./neofetch.nix
    ./pandoc.nix
    ./password-store.nix
    ./playerctl.nix
    ./starship.nix
    ./tldr.nix
    ./wine.nix
    ./yt-dlp.nix
    ./zellij.nix
    ./zoxide.nix
  ];

  hm = {
    alejandra = lib.mkDefault true;
    bat = lib.mkDefault true;
    bc = lib.mkDefault true;
    cmatrix = lib.mkDefault true;
    eza = lib.mkDefault true;
    fastfetch = lib.mkDefault true;
    fd = lib.mkDefault true;
    fzf = lib.mkDefault true;
    git = lib.mkDefault true;
    # lsd = lib.mkDefault false;
    # neofetch = lib.mkDefault false;
    # pandoc = lib.mkDefault false;
    # pass = lib.mkDefault false;
    playerctl = lib.mkDefault true;
    starship = lib.mkDefault true;
    tldr = lib.mkDefault true;
    # wine = lib.mkDefault false;
    # yt-dlp = lib.mkDefault false;
    zellij = lib.mkDefault true;
    zoxide = lib.mkDefault true;
  };
}
