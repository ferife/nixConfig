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
    ./mullvad.nix
    ./neofetch.nix
    ./nh.nix
    ./nixos-shell.nix
    ./nix-tree.nix
  ];

  config.nixos = {
    # distrobox = false;
    fastfetch = lib.mkDefault true;
    git = lib.mkDefault true;
    kitty = lib.mkDefault true;
    # neofetch = false;
    mullvad = lib.mkDefault true;
    nh = {
      enable = lib.mkDefault true;
      # autoClean = false;
      shellAliases = lib.mkDefault true;
    };
    # nixos-shell = false;
    nix-tree = lib.mkDefault true;
  };
}
