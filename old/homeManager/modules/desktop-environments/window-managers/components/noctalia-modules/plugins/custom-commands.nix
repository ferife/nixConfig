{
  config,
  lib,
  pkgs,
  ...
}: let
  plugins = config.hm.wm.components.noctalia.plugins;
in {
  config = lib.mkIf plugins.custom-commands {
    programs.noctalia-shell = {
      plugins.states.custom-commands = {
        enabled = true;
        sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      };
      pluginSettings.custom-commands = {
        commands = [
          {
            name = "File Manager";
            command = "xdg-open ~";
            icon = "folder";
          }
          {
            name = "System Monitor";
            command = "gnome-system-monitor || plasma-systemmonitor || xfce4-taskmanager";
            icon = "activity";
          }
          {
            name = "Hello";
            command = "notify-send \"hello\"";
            icon = "terminal-2";
          }
        ];
      };
    };
  };
}
