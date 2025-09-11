{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./gnome-console.nix
  ];

  nixos = {
    # gnome-console = false;
  };
}
