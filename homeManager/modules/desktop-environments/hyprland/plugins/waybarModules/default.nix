{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./battery-group.nix
    ./clock.nix
  ];
}
