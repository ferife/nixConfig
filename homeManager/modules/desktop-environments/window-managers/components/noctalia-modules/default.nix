{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./appLauncher.nix
    ./audio.nix
    ./bar.nix
    ./general.nix
    ./location.nix
  ];
}
