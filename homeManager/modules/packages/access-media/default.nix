{ config, lib, pkgs, ... }:

{
  imports = [
    ./qbittorrent.nix
    ./vlc.nix
  ];

  qbittorrentModule.enable = lib.mkDefault true;
  vlcModule.enable = lib.mkDefault true;
}
