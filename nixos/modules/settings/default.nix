{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./auto-upgrade-option.nix
      ./auto-storage-cleanup-option.nix
      ./nixpkgs-config.nix
      ./user-config.nix
    ];

    autoUpgradeOption.enable = lib.mkDefault true;
    autoStorageCleanupOption.enable = lib.mkDefault false;
}
