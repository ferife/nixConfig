{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkIf config.hm.wine {
    home.packages = [pkgs.wineWowPackages.waylandFull pkgs.winetricks];
  };
}
