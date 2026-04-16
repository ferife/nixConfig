{inputs, ...}: {
  # Libreoffice is an office suite

  flake.modules.homeManager.libreoffice = {pkgs, ...}: {
    home.packages = [pkgs.libreoffice];
  };
}
