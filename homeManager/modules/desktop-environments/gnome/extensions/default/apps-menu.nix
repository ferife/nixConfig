{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.appsMenu {
    programs.gnome-shell.extensions = [
      {
        id = "apps-menu@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.applications-menu;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "apps-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
