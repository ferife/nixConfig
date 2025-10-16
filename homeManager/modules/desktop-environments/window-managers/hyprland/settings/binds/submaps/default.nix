{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./move-window.nix
    ./resize-window.nix
  ];
}
