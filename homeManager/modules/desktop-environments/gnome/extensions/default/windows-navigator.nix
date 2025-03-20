{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.gnome.windowsNavigator {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
