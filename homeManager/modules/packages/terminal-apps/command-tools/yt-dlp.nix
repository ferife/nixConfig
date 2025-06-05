{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  config = lib.mkIf config.hm.yt-dlp {
    programs.yt-dlp = {
      enable = true;
      package = pkgs-unstable.yt-dlp;
    };
  };
}
