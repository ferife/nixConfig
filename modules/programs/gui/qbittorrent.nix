{inputs, ...}: {
  # qbittorrent is a client for unpacking perfectly legal Linux ISOs
  #
  # flake.modules.nixos.qbittorrent = {pkgs, ...}: {};

  flake.modules.homeManager.qbittorrent = {pkgs, ...}: {
    home.packages = [pkgs.qbittorrent];
  };
}
