{ config, lib, pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./gimp.nix
    ./libreoffice.nix
    ./obsidian.nix
    ./obs-studio.nix
    ./qbittorrent.nix
    ./thunderbird.nix
    ./tor-browser.nix
    ./vlc.nix
    ./vs-code.nix
  ];

  firefoxModule.enable     = lib.mkDefault true;
  gimpModule.enable        = lib.mkDefault true;
  libreofficeModule.enable = lib.mkDefault true;
  obsidianModule.enable    = lib.mkDefault true;
  obsStudioModule.enable   = lib.mkDefault true;
  thunderbirdModule.enable = lib.mkDefault true;
  torBrowserModule.enable  = lib.mkDefault true;
  vlcModule.enable         = lib.mkDefault true;

  qbittorrentModule.enable = lib.mkDefault false;
  vsCodeModule.enable      = lib.mkDefault false;
}
