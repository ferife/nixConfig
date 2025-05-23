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

  # TODO: Set up all F-key functions

  config.nixos.hyprland.enable = lib.mkDefault true;
}
