{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./deskEnv2
    ./gnome
    ./hyprland
  ];

  hm.gnome.enable = lib.mkDefault true;
  hm.hyprland.enable = lib.mkDefault true;
}
