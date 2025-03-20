{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./plugins
    ./settings
    ./hyprland.nix
  ];
}
