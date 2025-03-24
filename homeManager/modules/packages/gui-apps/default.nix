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
    ./floorp.nix
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
    chromium = false;
    eclipse = false;
    firefox = lib.mkDefault true;
    floorp = lib.mkDefault true;
    gimp = false;
    libreoffice = lib.mkDefault true;
    obsStudio = false;
    obsidian = lib.mkDefault true;
    qbittorrent = false;
    thunderbird = lib.mkDefault true;
    torBrowser = lib.mkDefault true;
    vlc = lib.mkDefault true;
    vsCode = false;
  };
}
