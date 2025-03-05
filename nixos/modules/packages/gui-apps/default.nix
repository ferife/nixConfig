{ config, lib, pkgs, ... }:
{
  imports = [
    ./gaming
    ./android-studio.nix
    ./mullvad-vpn.nix
    ./vlc.nix
  ];

  androidStudio.enable = true;
  gaming.enable = lib.mkDefault true;
  mullvadVpn.enable = lib.mkDefault true;
  vlc = {
    enable = lib.mkDefault true;
    replaceGnomeDefault = false;
  };
}
