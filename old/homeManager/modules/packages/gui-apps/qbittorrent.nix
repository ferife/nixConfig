{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.qbittorrent {
    home.packages = with pkgs; [
      qbittorrent
    ];
  };
}
