{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./waybar-style.nix
    ./hyprland

    ./battery.nix
    ./bluetooth.nix
    ./clock.nix
    ./idle-inhibitor.nix
    ./mpris.nix
    ./network.nix
    ./power-menu.nix
    ./power-profiles-daemon.nix
    ./settings-menu.nix
    # ./weather.nix
    ./wireplumber.nix
  ];
}
