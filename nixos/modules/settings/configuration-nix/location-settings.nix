# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    time.timeZone = "${config.nixos.specialArgs.system-settings.timezone}";

    # Select internationalisation properties.
    i18n.defaultLocale = "${config.nixos.specialArgs.system-settings.locale}";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "${config.nixos.specialArgs.system-settings.locale}";
      LC_IDENTIFICATION = "${config.nixos.specialArgs.system-settings.locale}";
      LC_MEASUREMENT = "${config.nixos.specialArgs.system-settings.locale}";
      LC_MONETARY = "${config.nixos.specialArgs.system-settings.locale}";
      LC_NAME = "${config.nixos.specialArgs.system-settings.locale}";
      LC_NUMERIC = "${config.nixos.specialArgs.system-settings.locale}";
      LC_PAPER = "${config.nixos.specialArgs.system-settings.locale}";
      LC_TELEPHONE = "${config.nixos.specialArgs.system-settings.locale}";
      LC_TIME = "${config.nixos.specialArgs.system-settings.locale}";
    };
  };
}
