{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.placesMenu {
    programs.gnome-shell.extensions = [
      {
        id = "places-menu@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.places-status-indicator;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "places-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
