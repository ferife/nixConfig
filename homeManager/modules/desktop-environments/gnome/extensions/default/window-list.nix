{ config, lib, ... }:
{
  options = {
    gnome.windowList.enable = lib.mkEnableOption "Enables the Window List extension, which shows all open windows in the current workspace in a bar across the bottom of the screen";
  };

  config = lib.mkIf config.gnome.windowList.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "window-list@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
