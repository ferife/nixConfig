{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./hyprland.nix
  ];

  nixos.hyprland.enable = lib.mkDefault true;

  # TODO: Use ONE of the two following lines to install a program to control screen light
  # programs.light.enable = true;
  environment.systemPackages = [pkgs.brightnessctl];
}
