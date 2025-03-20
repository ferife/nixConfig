{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.gnome.appsMenu {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "apps-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
