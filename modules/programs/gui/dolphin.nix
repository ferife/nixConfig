{inputs, ...}: {
  # Dolphin is a graphical file browser
  #
  # flake.modules.nixos.dolphin = {pkgs, ...}: {};

  flake.modules.homeManager.dolphin = {pkgs, ...}: {
    home.packages = [pkgs.kdePackages.dolphin];
  };
}
