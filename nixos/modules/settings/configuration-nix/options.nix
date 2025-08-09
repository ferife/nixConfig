{
  config,
  lib,
  ...
}: {
  options.nixos = {
    config-backups = lib.mkEnableOption "a backup of the configuration file (NOTE: This should NOT be used from within a flake)";
  };
}
