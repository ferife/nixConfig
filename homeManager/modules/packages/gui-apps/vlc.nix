{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.vlc {
    home.packages = with pkgs; [
      vlc
    ];
  };
}
