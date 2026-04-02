{
  config,
  lib,
  pkgs,
  ...
}: let
  noctalia = config.hm.wm.components.noctalia.enable;
in {
  config = lib.mkIf noctalia {
    programs.noctalia-shell.settings.location = {
      # name = config.hm.secrets.noctalia-shell-location-name;
      useFahrenheit = true;
      weatherShowEffects = false;
      showWeekNumberInCalendar = true;
      firstDayOfWeek = 1;
    };
  };
}
