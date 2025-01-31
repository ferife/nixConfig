{ config, lib, pkgs, ... }:
{
  imports = [
    ./gnome-terminal.nix
    ./kitty.nix
  ];

  gnomeTerminalModule.enable = lib.mkDefault true;
  kittyModule.enable         = lib.mkDefault true;
}
