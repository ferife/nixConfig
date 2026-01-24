{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.git {
    programs.git = {
      enable = true;

      settings = {
        user = {
          email = "github.backtrack434@passmail.net";
          name = "Fernando RF";
        };
      };
    };
  };
}
