

{ config, lib, pkgs, ... }:
{
  imports = [
    ./home-manager.nix
  ];

  homeManagerModule.enable = lib.mkDefault true;
  
}