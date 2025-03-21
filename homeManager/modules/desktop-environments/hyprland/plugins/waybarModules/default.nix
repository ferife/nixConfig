{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./battery.nix
    ./clock.nix
  ];
}
