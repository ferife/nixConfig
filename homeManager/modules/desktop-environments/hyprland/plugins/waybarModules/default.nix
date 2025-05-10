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
    ./idle-inhibitor.nix
    ./power-group.nix
  ];
}
