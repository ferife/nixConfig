{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./gas.nix
  ];

  config.nixos.scripts = {
    gas = lib.mkDefault true;
  };
}
