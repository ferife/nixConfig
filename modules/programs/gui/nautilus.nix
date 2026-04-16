{inputs, ...}: {
  # Nautilus is the graphical file browser packaged with GNOME

  flake.modules.homeManager.nautilus = {pkgs, ...}: {
    home.packages = [pkgs.nautilus];
  };
}
