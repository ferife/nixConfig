{inputs, ...}: {
  # imagemagick is an image editing suite
  #
  # flake.modules.nixos.imagemagick = {pkgs, ...}: {};

  flake.modules.homeManager.imagemagick = {pkgs, ...}: {
    home.packages = [pkgs.imagemagick];
  };
}
