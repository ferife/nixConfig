{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.keepassxc {
      home.packages = [pkgs.keepassxc];
    })

    (lib.mkIf (config.hm.keepassxc && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["org.keepassxc.KeePassXC.desktop"];};
    })
  ];
}
