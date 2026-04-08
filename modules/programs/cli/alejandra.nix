{inputs, ...}: {
  # flake.modules.nixos.alejandra = {pkgs, ...}: {};

  flake.modules.homeManager.alejandra = {pkgs, ...}: {
    home.packages = [pkgs.alejandra];
  };
}
