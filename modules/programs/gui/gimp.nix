{inputs, ...}: {
  # GIMP is an image editor
  #
  # flake.modules.nixos.gimp = {pkgs, ...}: {};

  flake.modules.homeManager.gimp = {pkgs, ...}: {
    home.packages = [pkgs.gimp];
  };
}
