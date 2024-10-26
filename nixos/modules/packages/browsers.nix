

{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    tor-browser # Browser for onion sites
  ];
  # services.tor = {
  #   enable = true;
  # };
}