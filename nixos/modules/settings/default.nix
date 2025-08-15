{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix
    ./configuration-nix

    ./bluetooth.nix
    ./documentation.nix
    ./firmware-updater.nix
    ./force-install-basics.nix
    ./nixpkgs-config.nix
    ./power-config.nix
    ./user-config.nix
  ];

  config.nixos = {
    bluetooth = lib.mkDefault true;
    documentation = false;
    firmware-updater = lib.mkDefault true;
    force-install-basics = lib.mkForce true;
    power-config = lib.mkDefault true;
  };
}
