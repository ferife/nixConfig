{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./gnome
    ./window-managers
  ];

  # config.nixos.gnome.enable = lib.mkForce false;
  # config.nixos.hyprland.enable = lib.mkForce false;
}
