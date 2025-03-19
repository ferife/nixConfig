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
}
