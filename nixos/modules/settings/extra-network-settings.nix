{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.extra-network-settings {
    services.resolved.enable = true;
  };
}
