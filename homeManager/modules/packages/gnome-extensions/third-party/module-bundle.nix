

{ config, lib, pkgs, ... }:
{
  imports = [
    ./caffeine.nix
    ./clipboard-indicator.nix
    ./forge.nix
    ./media-controls.nix
    ./tiling-shell.nix
    ./weather-oclock.nix
  ];

  # caffeineModule.enable = lib.mkDefault true;
  caffeineModule = {
    enable = lib.mkDefault true;
    # activate = lib.mkDefault false;
  };
  clipboardIndicatorModule.enable = lib.mkDefault true;
  forgeModule.enable = lib.mkDefault true;
  mediaControlsModule.enable = lib.mkDefault true;
  tilingShellModule.enable = lib.mkDefault false;
  weatherOclockModule.enable = lib.mkDefault true;
}