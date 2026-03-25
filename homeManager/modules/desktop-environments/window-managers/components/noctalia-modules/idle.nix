{
  config,
  lib,
  pkgs,
  ...
}: let
  enable-noctalia = config.hm.wm.components.noctalia;
in {
  config = lib.mkIf enable-noctalia {
    programs.noctalia-shell.settings.idle = {
      enabled = true;
    };
  };
}
