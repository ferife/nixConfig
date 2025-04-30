{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  config = lib.mkIf config.nixos.gaming.mangohud {
    environment.systemPackages = [pkgs.mangohud];
  };
}
