{ config, lib, ... }:
{
  config = lib.mkIf config.hm.gnome.windowList {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "window-list@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
