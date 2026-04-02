{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.procs {
    home.packages = [pkgs.procs];
    home.shellAliases = {
      "ps" = "procs";
    };
  };
}
