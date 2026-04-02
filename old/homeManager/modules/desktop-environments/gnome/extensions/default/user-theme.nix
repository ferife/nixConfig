{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.userTheme {
    programs.gnome-shell.extensions = [
      {
        id = "user-theme@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.user-themes;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
