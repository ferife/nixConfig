{
  config,
  lib,
  pkgs,
  ...
}: let
  noctalia = config.hm.wm.components.noctalia.enable;
in {
  config = lib.mkIf noctalia {
    programs.noctalia-shell.settings.idle = {
      enabled = true;
    };
  };
}
