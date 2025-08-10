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
    ./bluetooth.nix
    ./clock.nix
    ./idle-inhibitor.nix
    ./network.nix
    ./power-menu.nix
    ./settings-menu.nix
    # ./weather.nix
    ./wireplumber.nix
  ];
}
