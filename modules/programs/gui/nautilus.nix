{inputs, ...}: {
  # Nautilus is the graphical file browser packaged with GNOME
  #
  # flake.modules.nixos.nautilus = {pkgs, ...}: {};

  flake.modules.homeManager.nautilus = {pkgs, ...}: {
    home.packages = [pkgs.nautilus];
  };
}
