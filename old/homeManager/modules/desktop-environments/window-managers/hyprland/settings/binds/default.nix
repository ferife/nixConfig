{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./submaps

    ./f-keys.nix
    ./general.nix
  ];
}
