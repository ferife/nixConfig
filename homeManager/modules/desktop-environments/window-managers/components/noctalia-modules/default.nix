{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./appLauncher.nix
    ./bar.nix
    ./general.nix
  ];
}
