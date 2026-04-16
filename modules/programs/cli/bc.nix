{inputs, ...}: {
  # bc is a GNU program made for processing numeric expressions

  flake.modules.homeManager.bc = {pkgs, ...}: {
    home.packages = [pkgs.bc];
  };
}
