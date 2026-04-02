{
  config,
  lib,
  pkgs,
  ...
}: let
  plugins = config.hm.wm.components.noctalia.plugins;
in {
  config = lib.mkIf plugins.sticky-notes {
    programs.noctalia-shell = {
      plugins.states.sticky-notes = {
        enabled = true;
        sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      };
      pluginSettings.sticky-notes = {
        syncEnabled = false;
        # githubToken = "";
      };
    };
  };
}
