{ config, lib, ... }:
{
  config = lib.mkIf config.hm.gnome.nativeWindowPlacement {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "native-window-placement@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
