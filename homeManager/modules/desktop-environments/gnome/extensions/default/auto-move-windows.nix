{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.autoMoveWindows {
    programs.gnome-shell.extensions = [
      {
        id = "auto-move-windows@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.auto-move-windows;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
