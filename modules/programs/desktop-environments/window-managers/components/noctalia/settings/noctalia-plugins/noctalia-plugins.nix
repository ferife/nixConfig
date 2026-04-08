{inputs, ...}: {
  # flake.modules.nixos.noctalia-plugins = {pkgs, ...}: {};

  flake.modules.homeManager.noctalia-plugins = {lib, ...}: {
    programs.noctalia-shell = {
      settings.plugins.autoUpdate = true;
      plugins.sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      # To identify the available settings of a plugin, look at the ~/.config/noctalia/plugins/<plugin-name>/Settings.qml file
      # In that file, there will be a few lines that start as "pluginApi.pluginSettings.<setting-name> = <bla bla bla>"
      # Each available <setting-name> is a setting name that can be used
    };
  };
}
