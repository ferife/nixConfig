

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tor-browser # Browser for onion sites
  ];
}