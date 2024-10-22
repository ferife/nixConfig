

{ config, pkgs, ... }:
{
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    qbittorrent # Torrenting
    vlc         # Playing audio & video files
  ];
}