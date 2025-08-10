{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./bluetooth-toggle.nix
    ./hypr-kill-all-instances.nix
    ./modify-monitor-brightness.nix
    ./modify-volume.nix
    ./network-menu.nix
    ./power-menu.nix
    ./settings-menu.nix
  ];
}
