{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./submap.nix
    ./window.nix
    ./workspaces.nix
  ];
}
