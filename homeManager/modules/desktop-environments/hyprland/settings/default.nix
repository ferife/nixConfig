{ config, lib, pkgs, ... }:
{
  imports = [
    ./options.nix

    ./general-settings.nix
  ];

  hm.hyprland = {
    generalSettings.enable = lib.mkDefault config.hm.hyprland.enable;
  };
}
