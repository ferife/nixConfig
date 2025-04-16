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
  # TODO: Set up a VM tool such as QEMU and use it to test switching to Hyprland
}
