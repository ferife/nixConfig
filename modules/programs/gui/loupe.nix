{inputs, ...}: {
  # Loupe is the default image viewer in GNOME
  #
  # flake.modules.nixos.loupe = {pkgs, ...}: {};

  flake.modules.homeManager.loupe = {pkgs, ...}: {
    home.packages = [pkgs.loupe];
  };
}
