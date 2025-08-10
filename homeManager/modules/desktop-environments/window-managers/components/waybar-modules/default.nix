{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./waybar-style.nix
    ./hyprland

    ./battery-group.nix
    ./clock.nix
    ./idle-inhibitor.nix
    ./network.nix
    ./power-menu.nix
    ./pulseaudio.nix
    ./settings-menu.nix
    ./wireplumber.nix
  ];
}
