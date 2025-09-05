{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./dependencies
    ./gui-apps
    ./terminal-tools

    ./non-default-installs.nix
  ];
}
