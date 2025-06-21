{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./deskEnv2
    ./gnome
    ./window-managers
  ];

  hm.gnome.enable = lib.mkDefault true;
  hm.hyprland.enable = lib.mkDefault true;
}
