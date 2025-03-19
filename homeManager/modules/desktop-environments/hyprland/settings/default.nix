{ config, lib, pkgs, ... }:
{
  imports = [
    ./general-settings.nix
  ];

  hyprland = {
    generalSettings.enable = lib.mkDefault config.hyprland.enable;
  };
}
