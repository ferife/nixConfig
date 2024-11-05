# This is the module that I will use to configure GNOME

{ config, pkgs, ... }:
{
  # Install extensions
  home.packages = with pkgs; [
    dconf-editor                    # GNOME settings editor
    gnome-tweaks
    gnomeExtensions.caffeine        # Keeps screen on
    gnomeExtensions.forge           # Tiling Windows
    gnomeExtensions.weather-oclock  # Displays Weather
  ];

  # Settings
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      send-events = "disabled-on-external-mouse";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };
  };
}