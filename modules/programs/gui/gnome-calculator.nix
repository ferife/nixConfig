{inputs, ...}: {
  # GNOME calculator is a simple calculator
  #
  # flake.modules.nixos.gnome-calculator = {pkgs, ...}: {};

  flake.modules.homeManager.gnome-calculator = {pkgs, ...}: {
    home.packages = [pkgs.gnome-calculator];
  };
}
