{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.gnome.screenshotWindowSizer {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
