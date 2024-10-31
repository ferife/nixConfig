

{ config, lib, pkgs, ... }:
{
  imports = [
    ./home-manager.nix
    ./nh.nix
  ];

  homeManagerModule.enable = lib.mkDefault true;
  nhModule.enable = lib.mkDefault true;
}