{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ./options.nix

    ./gas.nix
  ];

  config.hm.scripts = {
    gas = lib.mkDefault true;
  };
}
