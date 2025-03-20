{ config, lib, pkgs, inputs, ... }:
{
  config = lib.mkIf config.hm.hyprland.waybar {
    programs.waybar = {
      enable = true;
      # settings = {};
    };
    home.packages = with pkgs; [
      font-awesome  # Dependency for displaying symbols in the bar
    ];
    wayland.windowManager.hyprland.settings.exec-once = [ "waybar" ];
  };
}
