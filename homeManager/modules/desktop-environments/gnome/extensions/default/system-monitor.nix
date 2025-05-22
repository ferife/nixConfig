{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.systemMonitor {
    programs.gnome-shell.extensions = [
      {
        id = "system-monitor@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.system-monitor;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "system-monitor@gnome-shell-extensions.gcampax.github.com"
        ];
      };
      "org/gnome/shell/extensions/system-monitor" = {
        show-cpu = true;
        show-memory = true;
        show-upload = true;
        show-download = true;
        show-swap = false;
      };
    };
  };
}
