

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    qbittorrent # Torrenting
    steam       # Games Launcher
    vlc         # Playing audio & video files
  ];
}