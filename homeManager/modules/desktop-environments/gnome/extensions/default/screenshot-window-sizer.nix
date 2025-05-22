{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.screenshotWindowSizer {
    programs.gnome-shell.extensions = [
      {
        id = "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.screenshot-window-sizer;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
