{
  config,
  lib,
  ...
}: {
  imports = [
    ./options.nix

    ./caffeine.nix
    ./clipboard-indicator.nix
    ./forge.nix
    ./media-controls.nix
    ./tiling-shell.nix
    ./weather-oclock.nix
  ];

  hm.gnome = {
    caffeine = lib.mkDefault config.hm.gnome.enable;
    clipboardIndicator = lib.mkDefault config.hm.gnome.enable;
    forge = lib.mkDefault config.hm.gnome.enable;
    mediaControls = lib.mkDefault config.hm.gnome.enable;
    tilingShell = lib.mkDefault false;
    weatherOClock = lib.mkDefault config.hm.gnome.enable;
  };
}
