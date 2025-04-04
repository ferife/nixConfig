{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ./options.nix

    ./chromium.nix
    ./eclipse.nix
    ./firefox.nix
    ./floorp.nix
    ./gimp.nix
    ./keepassxc.nix
    ./libreoffice.nix
    ./obsidian.nix
    ./obs-studio.nix
    ./qbittorrent.nix
    ./thunderbird.nix
    ./tor-browser.nix
    ./vlc.nix
    ./vs-code.nix
  ];

  # TODO: Install a basic calculator app
  # TODO: Install CAVA (the audio visualizer I see a lot on r/unixporn)

  hm = {
    chromium = false;
    eclipse = false;
    firefox = lib.mkIf (userSettings.mainBrowser == "firefox") true;
    floorp = lib.mkIf (userSettings.mainBrowser == "floorp") true;
    gimp = false;
    keepassxc = lib.mkDefault true;
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
