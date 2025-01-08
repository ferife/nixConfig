

{ config, lib, pkgs, ... }:
{
  imports = [
    ./deskEnv2/module-bundle.nix
    ./gnome/module-bundle.nix
  ];

  hmGnomeModule.enable = lib.mkDefault true;
}
