{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./login-managers

    ./gnome
    ./window-managers
  ];

  # config.nixos.gnome.enable = lib.mkForce false;
  # config.nixos.hyprland.enable = lib.mkForce false;
}
