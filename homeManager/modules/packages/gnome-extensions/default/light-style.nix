

{ config, lib, pkgs, ... }:
{

  options = {
    lightStyleModule.enable = lib.mkEnableOption "Enables the Light Style extension, which changes the default shell style to \"light\", while still following the system-wide \"dark\" preference";
  };

  config = lib.mkIf config.lightStyleModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "light-style@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}