{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

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

  hm = {
    chromium = lib.mkDefault false;
    eclipse = lib.mkDefault false;
    firefox = lib.mkDefault true;
    gimp = lib.mkDefault false;
    libreoffice = lib.mkDefault true;
    obsStudio = lib.mkDefault false;
    obsidian = lib.mkDefault true;
    qbittorrent = lib.mkDefault false;
    thunderbird = lib.mkDefault true;
    torBrowser = lib.mkDefault true;
    vlc = lib.mkDefault true;
    vsCode = lib.mkDefault false;
  };
}
