{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./gui-apps
    ./terminal-apps

    ./non-default-installs.nix
  ];
}
