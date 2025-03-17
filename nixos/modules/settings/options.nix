{ config, lib, ... }: {
  options.nixos = {
    autoUpgradeOption        = lib.mkEnableOption "automatic upgrading of nixpkgs in my flake.lock";
    autoStorageCleanupOption = lib.mkEnableOption "automatic cleanup of storage and old generations";
  };
}
