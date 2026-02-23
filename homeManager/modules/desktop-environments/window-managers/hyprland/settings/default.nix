{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./appearance.nix
    ./binds
    ./general.nix
  ];
}
