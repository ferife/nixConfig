{ config, lib, pkgs, ... }:
{
  imports = [
    ./options.nix

    ./gnome-terminal.nix
    ./kitty.nix
  ];

  hm = {
    gnomeTerminal = lib.mkDefault true;
    kitty         = lib.mkDefault true;
  };
}
