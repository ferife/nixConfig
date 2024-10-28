# Imported from access-media.nix

{ config, pkgs, ... }:
{
  programs.steam = {
    enable = true;
  };
  
  # The following lines are required for OpenRazer
  hardware.openrazer.enable = true; # Enable OpenRazer drivers
  users.users.fernandorf.extraGroups = [ "openrazer" ];

  services.input-remapper = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    
    # OpenRazer packages
    openrazer-daemon  # self-explanatory
    polychromatic     # front-end for controlling Razer peripheral LEDs
  
    # Other
    
  ];
}