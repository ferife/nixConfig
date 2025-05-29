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

  config.nixos.gnome.enable = lib.mkForce false;
}
