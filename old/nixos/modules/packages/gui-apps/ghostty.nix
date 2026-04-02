{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.ghostty {
    environment.systemPackages = [
      pkgs.ghostty
    ];
  };
}
