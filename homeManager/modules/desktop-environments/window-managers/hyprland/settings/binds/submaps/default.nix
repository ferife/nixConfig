{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./resize.nix
  ];
  # TODO: When home manager adds a nix-style way to configure submaps, switch to that
}
