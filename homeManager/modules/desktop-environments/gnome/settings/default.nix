

{ config, lib, pkgs, ... }:
{
  imports = [
    ./general-settings.nix
    ./laptop-settings.nix
  ];

  gnomeLaptopSettingsModule.enable = lib.mkDefault true;
}