{
  config,
  lib,
  ...
}: {
  options.nixos = {
    bluetooth = lib.mkEnableOption "bluetooth";
    documentation = lib.mkEnableOption "autogeneration of documentation for this config";
    firmware-updater = lib.mkEnableOption "a firmware updater";
    force-install-basics = lib.mkEnableOption "the forced installation of certain basic programs required for this config to work";
    lowPowerOptions = lib.mkEnableOption "behavior settings for dealing with low battery";
  };
}
