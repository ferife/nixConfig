{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.nautilus && !(config.hm.gnome.enable)) {
      home.packages = [pkgs.nautilus];
    })

    (lib.mkIf config.hm.gnome.enable {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["org.gnome.Nautilus.desktop"];};
    })
  ];
}
