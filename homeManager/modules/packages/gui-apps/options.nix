{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    audacity = mkEnableOption "Audacity, a sound editor";
    chromium = mkEnableOption "Chromium";
    eclipse = mkEnableOption "Eclipse";
    firefox = mkEnableOption "Firefox";
    floorp = mkEnableOption "Floorp";
    gimp = mkEnableOption "GIMP";
    gnome-calculator = mkEnableOption "the GNOME calculator app";
    keepassxc = mkEnableOption "KeePassXC, an offline password manager";
    libreoffice = mkEnableOption "LibreOffice";
    mpv = mkEnableOption "MVP, a media player";
    obsStudio = mkEnableOption "OBS Studio";
    obsidian = mkEnableOption "Obsidian.md";
    openshot = mkEnableOption "the OpenShot video editor";
    proton-mail = mkEnableOption "the desktop application for Proton Mail and Proton Calendar";
    qbittorrent = mkEnableOption "QBitTorrent";
    thunderbird = mkEnableOption "Thunderbird";
    tor-browser = mkEnableOption "Tor Browser";
    vlc = mkEnableOption "VLC, a media player";
    vsCode = mkEnableOption "VS Code";

    # Firefox/Floorp Config
    ff-config = mkOption {
      type = lib.types.attrs;
      description = "The configuration that will be used by default with Firefox, Floorp, and any other Firefox-based browser";
    };
  };
}
