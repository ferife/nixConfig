{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.git {
    programs.git = {
      enable = true;
    };
  };
}
