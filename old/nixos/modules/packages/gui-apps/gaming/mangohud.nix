{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.gaming.mangohud {
    environment.systemPackages = [pkgs.mangohud];
  };
}
