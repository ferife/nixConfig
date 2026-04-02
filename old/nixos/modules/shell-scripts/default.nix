{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./gas.nix
    ./reload-floorp-profile.nix
  ];
}
