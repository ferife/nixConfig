{ config, lib, ... }:
{
  options = {
    gnome.launchNewInstance.enable = lib.mkEnableOption "Enables the Launch New Instance extension, which forces app icons to always launch a new instance of the app instead of focusing on an existing window of the app";
  };

  config = lib.mkIf config.gnome.launchNewInstance.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
