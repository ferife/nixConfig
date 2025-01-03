

{ config, lib, pkgs, ... }:
{
  imports = [
    ./general-settings.nix
  ];

  gnomeGenSettingsNixosModule.enable = lib.mkDefault true;
}
