{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./f-keys.nix
    ./general.nix
  ];
}
