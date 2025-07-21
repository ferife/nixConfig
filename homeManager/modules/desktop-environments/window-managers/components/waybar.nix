{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./waybar-modules
  ];

  config = lib.mkIf config.hm.wm.components.waybar {
    programs.waybar = {
      enable = true;
      systemd = {
        enable = true;
        enableDebug = true;
        enableInspect = true;
      };

      # NOTE: Basic text formatting can be done using Pango Markup Format (https://docs.gtk.org/Pango/pango_markup.html#pango-markup)
      # GTK CSS properties can also be used (https://docs.gtk.org/gtk3/css-properties.html)

      settings = {
        mainBar = {
          layer = "top";
          position = "top";

          modules-left = [
            "${config.hm.wm.window-manager}/workspaces"
            "${config.hm.wm.window-manager}/window"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "wireplumber"
            "idle_inhibitor"
            "group/battery-group"
            "network"
            "custom/power-menu"
          ];
        };
      };

      # TODO: Add weather to waybar
      # TODO: Configure & style the workspaces, add a button to generate a workspace
      # TODO: Add a widget for the current status of my VPN
      # TODO: Add CPU usage, RAM usage, upload and download speed
      # TODO: Add general menu with the following options (use group module drawer function)
      #   backlight (screen brightness)
      #   App launcher
      #   Keyboard state (caps lock)
      # Add a module that displays any currently playing audio (use the MPRIS module)
    };

    home.packages = [
      config.hm.specialArgs.user-settings.font.package
    ];

    # Required to display unicode symbols in waybar
    fonts.fontconfig.enable = lib.mkForce true;
  };
}
