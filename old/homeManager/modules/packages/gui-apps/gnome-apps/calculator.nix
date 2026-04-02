{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.hm.gnome-calculator && !(config.hm.gnome.enable)) {
    home.packages = [pkgs.gnome-calculator];
  };
}
