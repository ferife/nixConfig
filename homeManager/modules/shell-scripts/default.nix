{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./modify-monitor-brightness.nix
    ./modify-volume.nix
    ./network-menu.nix
    ./power-menu.nix
  ];
}
