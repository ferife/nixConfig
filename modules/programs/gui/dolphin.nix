{inputs, ...}: {
  # Dolphin is the graphical file browser packaged with KDE Plasma
  #
  # flake.modules.nixos.dolphin = {pkgs, ...}: {};

  flake.modules.homeManager.dolphin = {pkgs, ...}: {
    home.packages = [pkgs.kdePackages.dolphin];
  };
}
