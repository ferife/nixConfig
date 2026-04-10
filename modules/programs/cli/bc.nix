{inputs, ...}: {
  # bc is a GNU program made for processing numeric expressions
  #
  # flake.modules.nixos.bc = {pkgs, ...}: {};

  flake.modules.homeManager.bc = {pkgs, ...}: {
    home.packages = [pkgs.bc];
  };
}
