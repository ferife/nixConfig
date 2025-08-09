{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix
    ./configuration-nix

    ./documentation.nix
    ./firmware-updater.nix
    ./force-install-basics.nix
    ./low-power-options.nix
    ./nixpkgs-config.nix
    ./user-config.nix
  ];

  config.nixos = {
    documentation = false;
    firmware-updater = lib.mkDefault true;
    force-install-basics = lib.mkForce true;
    lowPowerOptions = lib.mkDefault true;
  };
}
