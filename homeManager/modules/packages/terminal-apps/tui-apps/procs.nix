{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.procs {
    home.packages = with pkgs; [procs];
  };
}
