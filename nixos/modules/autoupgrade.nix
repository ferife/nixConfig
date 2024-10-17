

{ config, pkgs, ... }:
{
  system.autoUpgrade = {
    enable = true;
    flake = "~/Documents/nixConfig";
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "07:00";
    randomizedDelaySec = "45min";
  };
}