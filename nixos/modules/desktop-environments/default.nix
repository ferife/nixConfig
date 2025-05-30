{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./gnome
    ./hyprland
  ];

  # config.nixos.gnome.enable = lib.mkForce false;
  # config.nixos.hyprland.enable = lib.mkForce false;
}
