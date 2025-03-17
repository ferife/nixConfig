{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.hm.gnome.lightStyle {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "light-style@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
