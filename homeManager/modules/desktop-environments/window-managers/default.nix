{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./components

    ./hyprland
  ];
}
