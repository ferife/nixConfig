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
    ./shell-scripts

    ./options-special-args.nix
  ];
}
