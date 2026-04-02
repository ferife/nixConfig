{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.weatherOClock {
    programs.gnome-shell.extensions = [
      {
        id = "weatheroclock@CleoMenezesJr.github.io";
        package = pkgs.gnomeExtensions.weather-oclock;
      }
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
