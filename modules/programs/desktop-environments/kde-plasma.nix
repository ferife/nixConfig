{inputs, ...}: {
  # KDE plasma is a desktop environment

  flake.modules.nixos.kde-plasma = {lib, ...}: {
    services.desktopManager.plasma6.enable = true;
  };

  flake.modules.homeManager.kde-plasma = {lib, ...}: {
    qt.enable = true;
  };
}
