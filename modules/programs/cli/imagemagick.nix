{inputs, ...}: {
  # imagemagick is an image editing suite

  flake.modules.homeManager.imagemagick = {pkgs, ...}: {
    home.packages = [pkgs.imagemagick];
  };
}
