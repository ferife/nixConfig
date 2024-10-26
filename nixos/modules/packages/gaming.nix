# Imported from access-media.nix

{ config, pkgs, ... }:
{
  programs.steam = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    
  ];
}