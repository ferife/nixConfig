{inputs, ...}: {
  # GNOME clocks is a simple clock app
  #
  # flake.modules.nixos.gnome-clocks = {pkgs, ...}: {};

  flake.modules.homeManager.gnome-clocks = {pkgs, ...}: {
    home.packages = [pkgs.gnome-clocks];
  };
}
