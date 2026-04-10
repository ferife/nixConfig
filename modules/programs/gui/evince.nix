{inputs, ...}: {
  # Evince is the default docs viewer in GNOME
  #
  # flake.modules.nixos.evince = {pkgs, ...}: {};

  flake.modules.homeManager.evince = {pkgs, ...}: {
    home.packages = [pkgs.evince];
  };
}
