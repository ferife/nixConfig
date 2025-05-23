{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./auto-upgrade-option.nix
    ./auto-storage-cleanup-option.nix
    ./low-power-options.nix
    ./nixpkgs-config.nix
    ./user-config.nix
  ];

  config.nixos = {
    autoUpgradeOption = lib.mkDefault false;
    autoStorageCleanupOption = lib.mkDefault false;
    lowPowerOptions = true;
  };
}
