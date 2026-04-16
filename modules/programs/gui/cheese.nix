{inputs, ...}: {
  # Cheese is the camera application packaged with GNOME

  flake.modules.homeManager.cheese = {pkgs, ...}: {
    home.packages = [pkgs.cheese];
  };
}
