{inputs, ...}: {
  # alejandra is a nix code formatter

  flake.modules.homeManager.alejandra = {pkgs, ...}: {
    home.packages = [pkgs.alejandra];
  };
}
