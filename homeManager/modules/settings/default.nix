{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./assets-directories.nix
    ./basics.nix
    ./launch-apps.nix
  ];
}
