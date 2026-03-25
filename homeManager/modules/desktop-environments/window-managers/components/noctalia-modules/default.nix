{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./bar.nix
    ./general.nix
  ];
}
