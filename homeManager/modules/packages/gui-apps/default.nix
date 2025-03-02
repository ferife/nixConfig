{ config, lib, pkgs, ... }:
{
  imports = [
    ./chromium.nix
    ./eclipse.nix
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

  chromium.enable    = lib.mkDefault false;
  eclipse.enable     = lib.mkDefault false;
  firefox.enable     = lib.mkDefault true;
  gimp.enable        = lib.mkDefault false;
  libreoffice.enable = lib.mkDefault true;
  obsidian.enable    = lib.mkDefault true;
  obsStudio.enable   = lib.mkDefault false;
  qbittorrent.enable = lib.mkDefault false;
  thunderbird.enable = lib.mkDefault true;
  torBrowser.enable  = lib.mkDefault true;
  vlc.enable         = lib.mkDefault true;
  vsCode.enable      = lib.mkDefault false;
}
