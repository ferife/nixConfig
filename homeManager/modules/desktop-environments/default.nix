{ config, lib, pkgs, ... }:
{
  imports = [
    ./deskEnv2
    ./gnome
  ];

  hm.gnome.enable = lib.mkDefault true;
}
