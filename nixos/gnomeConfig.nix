# This is the module that I will use to configure GNOME

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome.dconf-editor # GNOME settings editor
    gnomeExtensions.caffeine # Keeps screen on
    gnomeExtensions.forge # Tiling Windows
    gnomeExtensions.weather-oclock # Displays Weather
  ];
}