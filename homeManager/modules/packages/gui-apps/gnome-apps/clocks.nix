{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.hm.gnome-clocks && !(config.hm.gnome.enable)) {
    home.packages = [pkgs.gnome-clocks];
  };
}
