# This is used for mullvadVPM

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mullvad-vpn
  ];

  networking.firewall.checkReversePath = "loose";
  networking.wireguard.enable = true;
  services.mullvad-vpn.enable = true;
}