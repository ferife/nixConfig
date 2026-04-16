{inputs, ...}: {
  # GNOME clocks is a simple clock app

  flake.modules.homeManager.gnome-clocks = {pkgs, ...}: {
    home.packages = [pkgs.gnome-clocks];
  };
}
