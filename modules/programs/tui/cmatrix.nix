{inputs, ...}: {
  # cmatrix is a screensaver-like tool that simulates the falling characters fron the Matrix movies
  #
  # flake.modules.nixos.cmatrix = {pkgs, ...}: {};

  flake.modules.homeManager.cmatrix = {pkgs, ...}: {
    home.packages = [pkgs.cmatrix];
    home.shellAliases.matrix = "cmatrix -aC blue -u 3";
  };
}
