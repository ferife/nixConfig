{ config, lib, ... }:
{
  options = {
    gnome.screenshotWindowSizer.enable = lib.mkEnableOption "Enables the Apps Menu extension, which lets you open applications from a menu divided by categories in the left side of the top bar";
  };

  config = lib.mkIf config.gnome.screenshotWindowSizer.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
