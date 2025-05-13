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
    ./firefox-options-stable.nix
    # ./firefox-options-unstable.nix
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

  # TODO: Install a basic calculator app (just install gnome-calculator separately from GNOME)
  # TODO: Install CAVA (the audio visualizer I see a lot on r/unixporn)

  hm = {
    chromium = false;
    eclipse = false;
    firefox = lib.mkIf (userSettings.mainBrowser == "firefox") true;
    floorp = lib.mkIf (userSettings.mainBrowser == "floorp") true;
    gimp = false;
    keepassxc = lib.mkDefault true;
    libreoffice = false;
    obsStudio = false;
    obsidian = lib.mkDefault true;
    qbittorrent = false;
    thunderbird = false;
    torBrowser = lib.mkDefault true;
    vlc = lib.mkDefault true;
    vsCode = false;
  };
}
