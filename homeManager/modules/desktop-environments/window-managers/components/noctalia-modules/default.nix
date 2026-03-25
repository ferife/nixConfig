{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./plugins

    ./appLauncher.nix
    ./audio.nix
    ./bar.nix
    ./controlCenter.nix
    ./general.nix
    ./idle.nix
    ./location.nix
    ./notifications.nix
  ];
}
