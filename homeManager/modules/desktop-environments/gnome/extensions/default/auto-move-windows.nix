{ config, lib, ... }:
{
  config = lib.mkIf config.hm.gnome.autoMoveWindows {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
