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
    ./controlCenter.nix
    ./general.nix
    ./location.nix
  ];
}
