{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.windowList {
    programs.gnome-shell.extensions = [
      {
        id = "window-list@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.window-list;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "window-list@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
