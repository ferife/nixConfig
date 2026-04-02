{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.lightStyle {
    programs.gnome-shell.extensions = [
      {
        id = "light-style@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.light-style;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "light-style@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
