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
    ./neofetch.nix
    ./nh.nix
  ];

  config.nixos = {
    distrobox = lib.mkDefault false;
    fastfetch = lib.mkDefault true;
    git = lib.mkDefault true;
    neofetch = lib.mkDefault false;
    nh = {
      enable = lib.mkDefault true;
      autoClean = lib.mkDefault false;
      shellAliases = lib.mkDefault true;
    };
  };
}
