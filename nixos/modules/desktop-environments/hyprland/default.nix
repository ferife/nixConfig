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

  config.nixos.hyprland.enable = lib.mkDefault true;
}
