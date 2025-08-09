{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./window-managers
    ./deskEnv2
    ./gnome
  ];

  config.hm = {
    wm.enable = lib.mkDefault true;

    gnome.enable = true;
  };
}
