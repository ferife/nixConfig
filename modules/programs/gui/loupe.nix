{inputs, ...}: {
  # Loupe is the default image viewer in GNOME

  flake.modules.homeManager.loupe = {pkgs, ...}: {
    home.packages = [pkgs.loupe];
  };
}
