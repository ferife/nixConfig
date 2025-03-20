{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./binds.nix # no options because I don't want to turn off all binds
  ];
}
