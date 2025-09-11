{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.obsidian {
      home.packages = [pkgs-unstable.obsidian];
    })

    (lib.mkIf (config.hm.obsidian && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["obsidian.desktop"];};
    })
  ];
}
