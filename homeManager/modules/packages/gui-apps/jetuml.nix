{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.jetuml {
    home.packages = [pkgs.jetuml];
  };
}
