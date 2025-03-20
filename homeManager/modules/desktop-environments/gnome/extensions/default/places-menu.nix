{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.gnome.placesMenu {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "places-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
