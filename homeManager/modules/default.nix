{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./appearance
    ./desktop-environments
    ./packages
    ./shell-scripts

    ./hm-general-settings.nix
  ];
}
