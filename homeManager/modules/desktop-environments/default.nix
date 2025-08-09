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
    ./plasma
  ];

  config.hm = {
    wm.enable = lib.mkDefault true;
    # gnome.enable = true;
    # plasma.enable = true;
  };
}
