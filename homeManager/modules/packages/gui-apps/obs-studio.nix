{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.obsStudio {
    programs.obs-studio = {
      enable = true;
    };
  };
}
