{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ./options.nix

    ./audacity.nix
    ./chromium.nix
    ./eclipse.nix
    ./firefox.nix
    # ./firefox-options-stable.nix
    ./firefox-options-unstable.nix
    ./floorp.nix
    ./gimp.nix
    ./gnome-calculator.nix
    ./keepassxc.nix
    ./libreoffice.nix
    ./mpv.nix
    ./obs-studio.nix
    ./obsidian.nix
    ./openshot.nix
    ./qbittorrent.nix
    ./thunderbird.nix
    ./tor-browser.nix
    ./vlc.nix
    ./vs-code.nix
  ];

  # TODO: Install a basic calculator app (just install gnome-calculator separately from GNOME)
  # TODO: Install CAVA (the audio visualizer I see a lot on r/unixporn)
  # TODO: Look into installing the zathura document viewer (stylable by stylix)

  hm = {
    audacity = lib.mkDefault true;
    chromium = false;
    eclipse = false;
    firefox = lib.mkIf (userSettings.mainBrowser == "firefox") true;
    floorp = lib.mkIf (userSettings.mainBrowser == "floorp") true;
    gimp = false;
    gnome-calculator = lib.mkDefault true;
    keepassxc = lib.mkDefault true;
    libreoffice = lib.mkDefault true;
    mpv = lib.mkDefault true;
    obsStudio = false;
    obsidian = lib.mkDefault true;
    openshot = lib.mkDefault true;
    qbittorrent = false;
    thunderbird = false;
    torBrowser = lib.mkDefault true;
    vlc = lib.mkDefault true;
    vsCode = false;
  };
}
