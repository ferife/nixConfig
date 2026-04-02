{
  config,
  lib,
  pkgs,
  ...
}: let
  noctalia = config.hm.wm.components.noctalia.enable;
in {
  imports = [
    ./options.nix

    ./custom-commands.nix
    ./sticky-notes.nix
  ];

  config = lib.mkIf noctalia {
    hm.wm.components.noctalia.plugins = {
      custom-commands = lib.mkDefault noctalia;
      sticky-notes = lib.mkDefault noctalia;
    };

    programs.noctalia-shell.plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
    };
  };
  # To identify the available settings of a plugin, look at the ~/.config/noctalia/plugins/<plugin-name>/Settings.qml file
  # In that file, there will be a few lines that start as "pluginApi.pluginSettings.<setting-name> = <bla bla bla>"
  # Each available <setting-name> is a setting name that can be used
}
