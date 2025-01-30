

{ config, lib, pkgs, ... }:
{
  imports = [
    ./deskEnv2
    ./gnome
  ];

  hmGnomeModule.enable = lib.mkDefault true;
}
