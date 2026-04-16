{inputs, ...}: {
  flake.modules.homeManager.noctalia-plugins = {
    lib,
    pkgs,
    ...
  }: {
    programs.noctalia-shell = {
      plugins.states.custom-commands = {
        enabled = true;
        sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      };
      pluginSettings.custom-commands.commands = [
        {
          name = "File Manager";
          command = "xdg-open ~";
          # command = "${lib.getExe pkgs.kdePackages.dolphin} ~";
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
}
