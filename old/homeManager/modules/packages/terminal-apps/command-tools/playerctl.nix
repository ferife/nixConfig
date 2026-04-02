{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.playerctl {
    services.playerctld.enable = true;

    # Required to ensure that playerctl can detect and control mpv
    programs.mpv.scripts = lib.mkIf config.hm.mpv [pkgs.mpvScripts.mpris];
  };
}
