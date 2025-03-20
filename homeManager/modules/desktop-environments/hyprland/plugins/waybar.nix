{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
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

          "clock" = {
            format = "  {:%H:%M   󰃮 %a %d %b}";
            interval = 1;
          };

          "battery" = {
            states = {
              # good = 95;
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            interval = 1;
            format-charging = "{capacity}% 󰂄";
            # format-
            format-icons = [
              " "
              " "
              " "
              " "
              " "
            ];
          };
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
