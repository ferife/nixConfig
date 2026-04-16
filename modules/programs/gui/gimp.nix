{inputs, ...}: {
  # GIMP is an image editor

  flake.modules.homeManager.gimp = {pkgs, ...}: {
    home.packages = [pkgs.gimp];
  };
}
