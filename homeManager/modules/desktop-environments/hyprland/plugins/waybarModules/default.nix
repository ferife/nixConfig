{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./battery.nix
    ./clock.nix
    ./power-profiles-daemon.nix
  ];
}
