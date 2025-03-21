{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./waybarModules
  ];

  config = lib.mkIf config.hm.hyprland.waybar {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          # font = "FiraCode Nerd Font Mono 16";
          layer = "top";
          position = "top";
          # mod = "dock";

          modules-left = [
            # "symbols"
            "clock"
            # "custom/weather"
            "hyprland/workspaces"
          ];
          modules-center = [
            "hyprland/window"
          ];
          modules-right = [
            "tray"
            # "custom/language"
            "battery"
            # "backlight"
            # "pulseaudio"
            # "pulseaudio#microphone"
          ];
        };
      };
    };
    home.packages = with pkgs; [
      nerdfonts # Dependency for displaying symbols in the bar
      # WARNING: nerdfonts alone takes up 8GB of storage
    ];
    wayland.windowManager.hyprland.settings.exec-once = ["waybar"];
  };
}
