{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.gnome.userTheme {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
