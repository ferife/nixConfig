{
  config,
  lib,
  pkgs,
  ...
}: {
  config.hm = let
    mkTrue = lib.mkForce true;
    mkFalse = lib.mkForce false;
  in {
    # GUI
    # audacity = mkTrue;
    chromium = mkTrue;
    eclipse = mkTrue;
    librewolf = mkTrue;
    qbittorrent = mkFalse;
    thunderbird = mkFalse;

    # Command tools
    yt-dlp = mkTrue;
    # wine = mkTrue;
  };
}
