# This is used for mullvadVPM

{ config, pkgs, ... }:
{
  networking.firewall.checkReversePath = "loose";
  networking.wireguard.enable = true;
  services.mullvad-vpn = {
    enable = true;
  };
}