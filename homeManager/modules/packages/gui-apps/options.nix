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
    ghostty = mkEnableOption "Ghostty, a terminal emulator that supports the Kitty graphics protocol, and prides itself on requiring as little configuration as possible (while still allowing for configuration)";
    gimp = mkEnableOption "GIMP";
    keepassxc = mkEnableOption "KeePassXC, an offline password manager";
    kitty = mkEnableOption "Kitty, a terminal emulator that takes advantage of the GPU, can display images, and adds great customization";
    libreoffice = mkEnableOption "LibreOffice";
    librewolf = mkEnableOption "LibreWolf, a privacy-focused Firefox-based browser";
    mpv = mkEnableOption "MVP, a media player";
    mullvad = mkEnableOption "the GUI for Mullvad VPN";
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
