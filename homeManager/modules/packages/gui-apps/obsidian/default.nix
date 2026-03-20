{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./core-plugins.nix
    ./obsidian.nix
  ];

  hm = {
    obsidian = lib.mkDefault true;
  };
}
