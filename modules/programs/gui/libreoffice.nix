{inputs, ...}: {
  # Libreoffice is an office suite
  #
  # flake.modules.nixos.libreoffice = {pkgs, ...}: {};

  flake.modules.homeManager.libreoffice = {pkgs, ...}: {
    home.packages = [pkgs.libreoffice];
  };
}
