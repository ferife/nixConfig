# This is used for mullvadVPN

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mullvad-vpn
  ];
  
  networking.firewall.checkReversePath = "loose";
  networking.wireguard.enable = true;
  services.mullvad-vpn = {
    enable = true;
  };
}