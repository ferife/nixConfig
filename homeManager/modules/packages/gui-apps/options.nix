{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    chromium = mkEnableOption "Chromium";
    eclipse = mkEnableOption "Eclipse";
    firefox = mkEnableOption "Firefox";
    floorp = mkEnableOption "Floorp";
    gimp = mkEnableOption "GIMP";
    keepassxc = mkEnableOption "KeePassXC, an offline password manager";
    libreoffice = mkEnableOption "LibreOffice";
    obsStudio = mkEnableOption "OBS Studio";
    obsidian = mkEnableOption "Obsidian.md";
    qbittorrent = mkEnableOption "QBitTorrent";
    thunderbird = mkEnableOption "Thunderbird";
    torBrowser = mkEnableOption "Tor Browser";
    vlc = mkEnableOption "VLC";
    vsCode = mkEnableOption "VS Code";

    # Firefox/Floorp Config
    ff-config = mkOption {
      type = lib.types.attrs;
      description = "The configuration that will be used by default with Firefox, Floorp, or any other Firefox-based browser";
    };
  };
}
