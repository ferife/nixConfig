{
  config,
  lib,
  pkgs,
  ...
}: let
  noctalia = config.hm.wm.components.noctalia.enable;
in {
  config = lib.mkIf noctalia {
    programs.noctalia-shell.settings.general = {
      lockScreenAnimations = true;
      clockFormat = "HH:mm:ss | ddd, MMM dd";
    };
  };
}
