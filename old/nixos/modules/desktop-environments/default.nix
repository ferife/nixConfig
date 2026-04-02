{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./login-managers
    ./window-managers

    ./gnome
    ./plasma
  ];
  config.nixos = {
    gnome.enable = true;
    # plasma.enable = true;
    wm = {
      hyprland.enable = true;
    };
  };
}
