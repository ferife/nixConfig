{
  config,
  lib,
  pkgs,
  ...
}: {
  options.hm.wm.components.noctalia.plugins = {
    custom-commands = lib.mkEnableOption "a plugin that adds custom commands that can be run from the launcher";
    sticky-notes = lib.mkEnableOption "a plugin that adds sticky notes";
  };
}
