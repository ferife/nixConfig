{
  config,
  lib,
  ...
}: {
  options.nixos.wm.sway = {
    enable = lib.mkEnableOption "Basic NixOS config for Sway that needed to happen outside of Home Manager";
  };
}
