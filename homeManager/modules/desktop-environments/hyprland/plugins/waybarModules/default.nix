{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./waybar-style.nix

    ./battery-group.nix
    ./clock.nix
    ./idle-inhibitor.nix
    ./power-menu.nix
    ./pulseaudio.nix
    ./workspaces.nix
  ];
}
