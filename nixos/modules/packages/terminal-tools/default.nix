{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./shells
    ./distrobox.nix
    ./fastfetch.nix
    ./git.nix
    ./kitty.nix
    ./neofetch.nix
    ./nh.nix
    ./nixos-shell.nix
    ./nix-tree.nix
  ];

  config.nixos = {
    # distrobox = lib.mkDefault false;
    fastfetch = lib.mkDefault true;
    git = lib.mkDefault true;
    kitty = lib.mkDefault true;
    # neofetch = lib.mkDefault false;
    nh = {
      enable = lib.mkDefault true;
      # autoClean = lib.mkDefault false;
      shellAliases = lib.mkDefault true;
    };
    # nixos-shell = lib.mkDefault true;
    nix-tree = lib.mkDefault true;
  };
}
