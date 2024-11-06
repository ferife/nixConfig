

{ config, lib, pkgs, ... }:
{
  imports = [
    ./caffeine.nix
    ./forge.nix
    ./tiling-shell.nix
    ./weather-oclock.nix
  ];

  caffeineModule.enable = lib.mkDefault true;
  forgeModule.enable = lib.mkDefault true;
  tilingShellModule.enable = lib.mkDefault false;
  weatherOclockModule.enable = lib.mkDefault true;
}