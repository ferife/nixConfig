{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./submap.nix
    ./workspaces.nix
  ];
}
