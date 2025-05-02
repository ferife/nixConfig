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

    ./hm-general-settings.nix
  ];
}
