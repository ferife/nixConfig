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
  ];

  config.nixos = {
    distrobox = false;
    fastfetch = lib.mkDefault true;
    git = lib.mkDefault true;
    kitty = lib.mkDefault true;
    neofetch = false;
    nh = {
      enable = lib.mkDefault true;
      autoClean = false;
      shellAliases = lib.mkDefault true;
    };
    # nixos-shell = lib.mkDefault true;
  };
}
