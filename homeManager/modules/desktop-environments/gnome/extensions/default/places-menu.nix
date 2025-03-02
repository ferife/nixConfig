{ config, lib, ... }:
{
  options = {
    gnome.placesMenu.enable = lib.mkEnableOption "Enables the Places Menu extension, which lets you open the file explorer to certain directories from a menu in the left side of the top bar";
  };

  config = lib.mkIf config.gnome.placesMenu.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "places-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
