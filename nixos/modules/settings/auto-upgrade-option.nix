{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.nixos.autoUpgradeOption {
    system.autoUpgrade = {
      enable = true;
      flake = "~/Documents/Configs/nixConfig/nixConfig-main";
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
