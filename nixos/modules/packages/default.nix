{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./dependencies
    ./gui-apps
    ./terminal-tools
  ];
  # TODO: Set up QEMU and use it to test switching to Hyprland
}
