

{ config, pkgs, ... }:
{
  imports = [
    ./gaming.nix
  ];
  environment.systemPackages = with pkgs; [
    qbittorrent # Torrenting
    vlc         # Playing audio & video files
  ];
}