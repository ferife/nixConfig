{ config, lib, ... }:
{
  options = {
    gnome.systemMonitor.enable = lib.mkEnableOption "Enables the System Monitor extension, which shows system usage information in the right side of the top bar";
  };

  config = lib.mkIf config.gnome.systemMonitor.enable {
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
