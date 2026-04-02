{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.gnome-console {
      home.packages = [pkgs.gnome-console];
    })

    # (lib.mkIf (config.hm.gnome-console && config.hm.gnome.enable) {
    (lib.mkIf ((config.hm.specialArgs.user-settings.terminal == "gnome-console") && config.hm.gnome.enable) {
      dconf.settings = {"org/gnome/shell".favorite-apps = ["org.gnome.Console.desktop"];};
    })
  ];
}
