{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./window-managers
    ./gnome
    ./plasma
  ];

  config.hm = {
    wm.enable = lib.mkDefault true;
    # gnome.enable = true;
    # plasma.enable = true;
  };
}
