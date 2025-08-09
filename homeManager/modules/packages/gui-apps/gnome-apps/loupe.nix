{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.hm.loupe && !(config.hm.gnome.enable)) {
    home.packages = [pkgs.loupe];
  };
}
