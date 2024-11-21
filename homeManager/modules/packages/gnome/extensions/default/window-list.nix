

{ config, lib, pkgs, ... }:
{

  options = {
    windowListModule.enable = lib.mkEnableOption "Enables the Window List extension, which shows all open windows in the current workspace in a bar across the bottom of the screen";
  };

  config = lib.mkIf config.windowListModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "window-list@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}