{ config, lib, ... }: {
  options.nixos.hyprland = {
		enable = lib.mkEnableOption "Basic NixOS config for Hyprland that needed to happen outside of Home Manager";
  };
}
