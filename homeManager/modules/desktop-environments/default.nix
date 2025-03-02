{ config, lib, pkgs, ... }:
{
  imports = [
    ./deskEnv2
    ./gnome
  ];

  gnome.enable = lib.mkDefault true;
}
