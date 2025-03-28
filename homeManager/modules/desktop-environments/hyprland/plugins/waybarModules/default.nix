{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./waybar-style.nix

    ./battery-group.nix
    ./clock.nix
    ./power-group.nix
  ];
}
