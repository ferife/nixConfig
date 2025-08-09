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
  config.nixos = {
    gnome.enable = true;
    wm = {
      hyprland.enable = true;
    };
  };
}
