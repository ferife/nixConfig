

{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    dconf-editor  # Allows for the editing of GNOME settings in NixOS
    gnome-tweaks  # Find the existence of hidden settings much more easily than with dconf editor
  ];

  dconf.settings = {
    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      show-battery-percentage = true;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      send-events = "disabled-on-external-mouse";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };
  };
}