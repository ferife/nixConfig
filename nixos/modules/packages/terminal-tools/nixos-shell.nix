{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.nixos-shell {
    environment.systemPackages = with pkgs; [nixos-shell];
  };
}
