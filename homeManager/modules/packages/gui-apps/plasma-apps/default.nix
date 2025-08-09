{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./dolphin.nix
  ];

  hm = {
    dolphin = lib.mkDefault true;
  };
}
