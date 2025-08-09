{
  config,
  lib,
  pkgs,
  ...
}: {
  # Evince is the default docs viewer packaged with GNOME
  config = lib.mkIf (config.hm.evince && !(config.hm.gnome.enable)) {
    home.packages = [pkgs.evince];
  };
}
