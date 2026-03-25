{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./bar.nix
  ];
}
