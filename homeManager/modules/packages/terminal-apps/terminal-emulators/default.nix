{ config, lib, pkgs, ... }:
{
  imports = [
    ./gnome-terminal.nix
    ./kitty.nix
  ];

  gnomeTerminal.enable = lib.mkDefault true;
  kitty.enable         = lib.mkDefault true;
}
