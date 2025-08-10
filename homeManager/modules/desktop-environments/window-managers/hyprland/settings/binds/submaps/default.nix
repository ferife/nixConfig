{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./move.nix
    ./resize.nix
  ];
  # TODO: When home manager adds a nix-style way to configure submaps, switch to that
}
