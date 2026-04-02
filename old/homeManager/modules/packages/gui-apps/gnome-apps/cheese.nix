{
  config,
  lib,
  pkgs,
  ...
}: {
  # Cheese is the default camera application packaged with GNOME
  config = lib.mkIf (config.hm.cheese && !(config.hm.gnome.enable)) {
    home.packages = [pkgs.cheese];
  };
}
