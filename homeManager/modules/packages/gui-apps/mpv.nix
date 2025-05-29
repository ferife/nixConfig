{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.mpv {
    programs.mpv = {
      enable = true;
    };
  };
}
