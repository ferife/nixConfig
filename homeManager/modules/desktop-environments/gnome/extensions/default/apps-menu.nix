{ config, lib, ... }:
{
  options = {
    gnome.appsMenu.enable = lib.mkEnableOption "Enables the Apps Menu extension, which lets you open applications from a menu divided by categories in the left side of the top bar";
  };

  config = lib.mkIf config.gnome.appsMenu.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "apps-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
