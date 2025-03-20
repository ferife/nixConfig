{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.fastfetch {
    environment.systemPackages = with pkgs; [fastfetch];
  };
}
