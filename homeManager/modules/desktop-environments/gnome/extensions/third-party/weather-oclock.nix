{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.weatherOClock {
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
