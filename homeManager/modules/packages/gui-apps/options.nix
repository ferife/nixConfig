{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    audacity = mkEnableOption "Audacity, a sound editor";
    eclipse = mkEnableOption "Eclipse";
    ghostty = mkEnableOption "Ghostty, a terminal emulator that supports the Kitty graphics protocol, and prides itself on requiring as little configuration as possible (while still allowing for configuration)";
    gimp = mkEnableOption "GIMP";
    jetuml = mkEnableOption "JetUML, a FOSS GUI used to generate UML diagrams";
    keepassxc = mkEnableOption "KeePassXC, an offline password manager";
    kitty = mkEnableOption "Kitty, a terminal emulator that takes advantage of the GPU, can display images, and adds great customization";
    libreoffice = mkEnableOption "LibreOffice";
    mpv = mkEnableOption "MVP, a media player";
    mullvad = mkEnableOption "the GUI for Mullvad VPN";
    obsStudio = mkEnableOption "OBS Studio";
    openshot = mkEnableOption "the OpenShot video editor";
    proton-mail = mkEnableOption "the desktop application for Proton Mail and Proton Calendar";
    qbittorrent = mkEnableOption "QBitTorrent";
    thunderbird = mkEnableOption "Thunderbird";
    vlc = mkEnableOption "VLC, a media player";
    vsCode = mkEnableOption "VS Code";
  };
}
