{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.driveMenu {
    programs.gnome-shell.extensions = [
      {
        id = "drive-menu@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.removable-drive-menu;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
