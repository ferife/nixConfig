{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./core-plugins.nix
    ./hotkeys.nix
    ./obsidian.nix
    ./settings.nix
  ];

  hm = {
    obsidian = lib.mkDefault true;
  };
}
