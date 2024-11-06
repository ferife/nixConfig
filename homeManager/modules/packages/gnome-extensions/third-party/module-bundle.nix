

{ config, lib, pkgs, ... }:
{
  imports = [
    ./caffeine.nix
    ./forge.nix
    ./tiling-shell.nix
    ./weather-oclock.nix
  ];

  # caffeineModule.enable = lib.mkDefault true;
  caffeineModule = {
    enable = lib.mkDefault true;
    # activate = lib.mkDefault false;
  };
  forgeModule.enable = lib.mkDefault true;
  tilingShellModule.enable = lib.mkDefault false;
  weatherOclockModule.enable = lib.mkDefault true;
}