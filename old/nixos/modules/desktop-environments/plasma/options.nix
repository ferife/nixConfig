{
  config,
  lib,
  ...
}: {
  options.nixos.plasma = {
    enable = lib.mkEnableOption "some basic NixOS config for KDE Plasma 6 that needed to happen outside of Home Manager";
  };
}
