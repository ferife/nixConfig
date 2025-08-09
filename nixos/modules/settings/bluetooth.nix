# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.bluetooth {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.Policy.AutoEnable = false;
    };

    # To open blueman from the CLI, run `blueman-manager`
    services.blueman.enable = true;
  };
}
