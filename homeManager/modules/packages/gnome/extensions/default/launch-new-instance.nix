

{ config, lib, pkgs, ... }:
{

  options = {
    launchNewInstanceModule.enable = lib.mkEnableOption "Enables the Launch New Instance extension, which forces app icons to always launch a new instance of the app instead of focusing on an existing window of the app";
  };

  config = lib.mkIf config.launchNewInstanceModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}