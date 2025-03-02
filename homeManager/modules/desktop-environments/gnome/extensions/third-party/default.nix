{ config, lib, ... }:
{
  imports = [
    ./caffeine.nix
    ./clipboard-indicator.nix
    ./forge.nix
    ./media-controls.nix
    ./tiling-shell.nix
    ./weather-oclock.nix
  ];

  gnome = {
    caffeine.enable           = lib.mkDefault config.gnome.enable;
    clipboardIndicator.enable = lib.mkDefault config.gnome.enable;
    forge.enable              = lib.mkDefault config.gnome.enable;
    mediaControls.enable      = lib.mkDefault config.gnome.enable;
    tilingShell.enable        = lib.mkDefault false;
    weatherOClock.enable      = lib.mkDefault config.gnome.enable;
  };
}
