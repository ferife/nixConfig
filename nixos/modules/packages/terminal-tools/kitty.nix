{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.kitty {
    environment.systemPackages = [
      pkgs.kitty
    ];
  };
}
