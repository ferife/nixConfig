{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.nix-tree {
    environment.systemPackages = [pkgs.nix-tree];
  };
}
