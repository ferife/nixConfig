{ config, lib, pkgs, ... }:
{
  imports = [
    ./gaming
    ./mullvad-vpn.nix
    ./vlc.nix
  ];

  gaming.enable = lib.mkDefault true;
  mullvadVpn.enable = lib.mkDefault true;
  vlcModule = {
    enable = lib.mkDefault true;
    replaceGnomeDefault = false;
  };
}
