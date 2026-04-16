{inputs, ...}: {
  # GNOME calculator is a simple calculator

  flake.modules.homeManager.gnome-calculator = {pkgs, ...}: {
    home.packages = [pkgs.gnome-calculator];
  };
}
