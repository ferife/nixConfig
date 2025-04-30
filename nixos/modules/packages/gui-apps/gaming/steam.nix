{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.gaming.steam {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };
}
