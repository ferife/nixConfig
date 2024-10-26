# Imported from access-media.nix

{ config, pkgs, ... }:
{
  imports = [
    ./openrazer.nix # Support & Configure Razer-brand peripheral usage
  ];

  programs.steam = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    
  ];
}