{inputs, ...}: {
  # flake.modules.nixos.noctalia-plugins = {pkgs, ...}: {};

  flake.modules.homeManager.noctalia-plugins = {lib, ...}: {
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
