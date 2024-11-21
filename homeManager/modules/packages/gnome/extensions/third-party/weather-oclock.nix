

{ config, lib, pkgs, ... }:
{

  options = {
    weatherOclockModule.enable = lib.mkEnableOption "Installs & enables the Weather OClock extension, which displays the weather in the pill at the center of the top bar";
  };

  config = lib.mkIf config.weatherOclockModule.enable {
    home.packages = with pkgs; [
      gnomeExtensions.weather-oclock
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "weatheroclock@CleoMenezesJr.github.io"
        ];
      };
    };
  };
}