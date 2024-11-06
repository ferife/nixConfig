#system-monitor@gnome-shell-extensions.gcampax.github.com

{ config, lib, pkgs, ... }:
{

  options = {
    systemMonitorModule.enable = lib.mkEnableOption "Enables the System Monitor extension, which shows system usage information in the right side of the top bar";
  };

  config = lib.mkIf config.systemMonitorModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "system-monitor@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };

  
}