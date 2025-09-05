{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./gnome-apps
    ./plasma-apps
    ./audacity.nix
    ./chromium.nix
    ./eclipse.nix
    ./firefox.nix
    ./firefox-options.nix
    ./floorp.nix
    ./gimp.nix
    ./keepassxc.nix
    ./libreoffice.nix
    ./librewolf.nix
    ./mpv.nix
    ./obs-studio.nix
    ./obsidian.nix
    ./openshot.nix
    ./proton-mail.nix
    ./qbittorrent.nix
    ./thunderbird.nix
    ./tor-browser.nix
    ./vlc.nix
    ./vs-code.nix
  ];

  hm = {
    audacity = lib.mkDefault true;
    chromium = lib.mkDefault false;
    # eclipse = lib.mkDefault false;
    firefox = lib.mkIf (config.hm.specialArgs.user-settings.browser == "firefox") true;
    floorp = lib.mkIf (config.hm.specialArgs.user-settings.browser == "floorp") true;
    # gimp = lib.mkDefault false;
    keepassxc = lib.mkDefault true;
    libreoffice = lib.mkDefault true;
    librewolf = lib.mkIf (config.hm.specialArgs.user-settings.browser == "librewolf") true;
    mpv = lib.mkDefault true;
    # obsStudio = lib.mkDefault false;
    obsidian = lib.mkDefault true;
    # openshot = lib.mkDefault false;
    proton-mail = lib.mkDefault true;
    qbittorrent = lib.mkDefault true;
    thunderbird = lib.mkDefault true;
    tor-browser = lib.mkDefault true;
    # vlc = lib.mkDefault false;
    # vsCode = lib.mkDefault false;
  };
}
