{ config, lib, ... }:
{
  config = lib.mkIf config.hm.gnome.driveMenu {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
