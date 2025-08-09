# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.force-install-basics {
    # The following lines enable certain programs that I consider essential for the minimum installation of a computer using this config
    nixos.git = lib.mkForce true;
    nixos.fastfetch = lib.mkForce true;
    nixos.homeManager = lib.mkForce true;
    nixos.nh.enable = lib.mkForce true;
    environment.variables = {
      NIXOS_CONFIG_FILES_DIR = "/etc/${config.nixos.specialArgs.system-settings.config-files-dir}";
      NIXOS_CONFIG_SCRIPTS_DIR = "/etc/${config.nixos.specialArgs.system-settings.scripts-dir}";
      NIXOS_CONFIG_ASSETS_DIR = "/etc/${config.nixos.specialArgs.system-settings.assets-dir}";
    };
  };
}
