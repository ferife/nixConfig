{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.nativeWindowPlacement {
    programs.gnome-shell.extensions = [
      {
        id = "native-window-placement@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.native-window-placement;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "native-window-placement@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
