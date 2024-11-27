

{ config, lib, pkgs, ... }:
{

  options = {
    appsMenuModule.enable = lib.mkEnableOption "Enables the Apps Menu extension, which lets you open applications from a menu divided by categories in the left side of the top bar";
  };

  config = lib.mkIf config.appsMenuModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "apps-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}