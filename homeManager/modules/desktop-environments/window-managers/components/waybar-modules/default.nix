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
    ./network.nix
    ./power-menu.nix
    ./pulseaudio.nix
    ./wireplumber.nix
    ./workspaces.nix
  ];
}
