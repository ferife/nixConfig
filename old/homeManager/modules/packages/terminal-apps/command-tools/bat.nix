{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.bat {
    programs.bat = {
      enable = true;
    };
    home.shellAliases = {
      cat = "bat";
    };
  };
}
