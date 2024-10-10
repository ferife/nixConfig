# This is the module that I will use to configure GNOME

{ config, pkgs, ... }:
{
  # Install extensions
  home.packages = with pkgs; [
    gnome.dconf-editor              # GNOME settings editor
    gnomeExtensions.caffeine        # Keeps screen on
    gnomeExtensions.forge           # Tiling Windows
    gnomeExtensions.weather-oclock  # Displays Weather
  ];

  # Settings
  # programs.dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      send-events = "disabled-on-external-mouse";
    };
  };
}