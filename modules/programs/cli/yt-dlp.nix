{inputs, ...}: {
  # yt-dlp is a tool designed to download youtube videos in various different formats

  flake.modules.homeManager.yt-dlp = {pkgs, ...}: {
    programs.yt-dlp.enable = true;
  };
}
