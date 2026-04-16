{inputs, ...}: {
  # Evince is the default docs viewer in GNOME

  flake.modules.homeManager.evince = {pkgs, ...}: {
    home.packages = [pkgs.evince];
  };
}
