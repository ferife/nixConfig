{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.distrobox {
    environment.systemPackages = [
      pkgs.kitty
    ];
  };
}
