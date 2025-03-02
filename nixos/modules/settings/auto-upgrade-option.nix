{ config, lib, pkgs, ... }:
{
  options = {
    autoUpgradeOption.enable = lib.mkEnableOption "Automatically upgrades nixpkgs";
  };

  config = lib.mkIf config.autoUpgradeOption.enable {
    system.autoUpgrade = {
      enable = true;
      flake = "~/Documents/Configs/nixConfig";
      flags = [
        "--update-input"
        "nixpkgs"
        "-L" # print build logs
      ];
      dates = "07:00";
      randomizedDelaySec = "45min";
    };
  };
}
