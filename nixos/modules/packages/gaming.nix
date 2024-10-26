# Imported from access-media.nix

{ config, pkgs, ... }:
{
  programs.steam = {
    enable = true;
  };
  
  # The following lines are required for OpenRazer
  hardware.openrazer.enable = true; # Enable OpenRazer drivers
  environment.systemPackages = with pkgs; [
    openrazer-daemon  # self-explanatory
    polychromatic     # front-end for controlling Razer peripheral LEDs
  ];
  # Add a copy of the following line for each user that needs to use the openrazer-daemon
  users.users.fernandorf.extraGroups = [ "openrazer" ];
}