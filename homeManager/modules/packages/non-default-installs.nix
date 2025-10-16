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
    chromium = mkTrue;
    librewolf = mkTrue;
    qbittorrent = mkFalse;
    thunderbird = mkFalse;

    # Command tools
    yt-dlp = mkTrue;
    wine = mkTrue; # Needed for my CompArch class
  };
}
