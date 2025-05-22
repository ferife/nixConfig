{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.windowsNavigator {
    programs.gnome-shell.extensions = [
      {
        id = "windowsNavigator@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.windownavigator;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
