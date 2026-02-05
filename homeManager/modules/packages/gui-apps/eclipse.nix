{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.eclipse {
    programs.eclipse = {
      enable = true;
      package = pkgs.eclipses.eclipse-java;
    };
  };
}
