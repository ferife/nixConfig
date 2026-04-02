{inputs, ...}: {
  # flake.modules.nixos.noctalia = {pkgs, ...}: {};

  flake.modules.homeManager.noctalia = {lib, ...}: {
    programs.noctalia-shell.settings.location = {
      # name = config.hm.secrets.noctalia-shell-location-name;

      useFahrenheit = true;
      weatherShowEffects = false;
      showWeekNumberInCalendar = true;
      firstDayOfWeek = 1;
    };
  };
}
