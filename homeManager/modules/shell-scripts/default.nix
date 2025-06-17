{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./modify-volume.nix
    ./network-menu.nix
  ];
}
