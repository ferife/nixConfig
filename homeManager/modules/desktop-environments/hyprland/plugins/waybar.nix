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
            "hyprland/workspaces"
            "hyprland/window"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "idle_inhibitor"
            "group/battery-group"
            "group/power-group"
          ];
        };
      };

      # TODO: Add weather to waybar
      # TODO: Add power menu to waybar (power off, reboot, sleep, log out)
      # TODO: Configure & style the workspaces, add a button to generate a workspace
      # TODO: Add a widget for the current status of my VPN
      # TODO: Add CPU usage, RAM usage, upload and download speed
      # TODO: Add general menu with the following options (use group module drawer function)
      #   backlight (screen brightness)
      #   App launcher
      #   Keyboard state (caps lock)
      #   Volume control (PulseAudio slider)

      # TODO: Use the native idle_inhibitor module
      # This will, by itself and with no need for any external program, inhibit idle behavior
    };

    home.packages = with pkgs; [
      nerdfonts # Dependency for displaying symbols in the bar
      # WARNING: nerdfonts alone takes up 8GB of storage
    ];
    wayland.windowManager.hyprland.settings.exec-once = ["waybar"];
  };
}
