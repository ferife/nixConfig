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
    ./settings

    ./options-special-args.nix
  ];
}
