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
        # enableDebug = true;
        # enableInspect = true;
      };

      # NOTE: Basic text formatting can be done using Pango Markup Format (https://docs.gtk.org/Pango/pango_markup.html#pango-markup)
      # GTK CSS properties can also be used (https://docs.gtk.org/gtk3/css-properties.html)

      settings = {
        mainBar = {
          layer = "top";
          position = "top";

          modules-left = [
            "custom/settings-menu"
            "${config.hm.wm.window-manager}/workspaces"
            "${config.hm.wm.window-manager}/window"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "bluetooth"
            "wireplumber"
            "idle_inhibitor"
            "group/battery-group"
            "network"
            "custom/power-menu"
          ];
        };
      };
    };

    home.packages = [
      config.hm.specialArgs.user-settings.font.package
    ];

    # Required to display unicode symbols in waybar
    fonts.fontconfig.enable = lib.mkForce true;

    # wayland.windowManager.hyprland.settings.exec-once = lib.mkIf (config.hm.wm.components.waybar && config.hm.wm.hyprland.enable && !config.hm.gnome.enable) ["waybar"];
  };
}
