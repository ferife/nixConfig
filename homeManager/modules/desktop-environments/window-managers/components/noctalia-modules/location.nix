{
  config,
  lib,
  pkgs,
  ...
}: let
  enable-noctalia = config.hm.wm.components.noctalia;
in {
  config = lib.mkIf enable-noctalia {
    programs.noctalia-shell.settings.location = {
      # name = config.hm.secrets.noctalia-shell-location-name;
      useFahrenheit = true;
      weatherShowEffects = false;
      showWeekNumberInCalendar = true;
      firstDayOfWeek = 1;
    };
  };
}
