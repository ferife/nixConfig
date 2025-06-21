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
    gnome.enable = true;

    wm.enable = lib.mkDefault true;
  };
}
