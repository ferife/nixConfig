{
  config,
  lib,
  ...
}: {
  options.nixos.wm.hyprland = {
    enable = lib.mkEnableOption "Basic NixOS config for Hyprland that needed to happen outside of Home Manager";
  };
}
