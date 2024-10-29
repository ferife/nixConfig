{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./gaming/module-bundle.nix
    ./qbittorrent.nix
    ./vlc.nix
  ];

  gaming.enable = lib.mkDefault true;
  qbittorrentModule.enable = lib.mkDefault true;
  vlcModule.enable = lib.mkDefault true;
}