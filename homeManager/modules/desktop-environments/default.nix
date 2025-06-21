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

  config.hm = {
    gnome.enable = lib.mkDefault true;
    wm = {
      enable = lib.mkDefault true;
      window-manager = "hyprland";
    };
  };
}
