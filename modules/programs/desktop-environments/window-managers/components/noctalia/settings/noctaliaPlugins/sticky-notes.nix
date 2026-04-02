{inputs, ...}: {
  # flake.modules.nixos.noctaliaPlugins = {pkgs, ...}: {};

  flake.modules.homeManager.noctaliaPlugins = {lib, ...}: {
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
