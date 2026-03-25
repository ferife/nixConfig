{
  config,
  lib,
  pkgs,
  ...
}: {
  options.hm.wm.components.noctalia.plugins = {
    sticky-notes = lib.mkEnableOption "a plugin that adds sticky notes";
  };
}
