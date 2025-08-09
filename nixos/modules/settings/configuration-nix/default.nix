{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./minimal-config.nix
    ./config-backups.nix
    ./flakes-and-nixpkgs.nix
    ./io.nix
    ./location-settings.nix
    ./networking.nix
    ./x11.nix
  ];

  config.nixos = {
    config-backups = lib.mkForce false;
  };
}
