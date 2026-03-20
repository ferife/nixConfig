{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./obsidian.nix
  ];

  hm = {
    obsidian = lib.mkDefault true;
  };
}
