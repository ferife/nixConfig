{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    # hint Electron apps to use Wayland
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    wayland.windowManager.hyprland = {
      # allow home manager to configure hyprland
      enable = true;
      systemd.enable = true;
      settings = {
        "$mainMod" = "SUPER";

        # Any monitors whose settings are not explicitly defined will be set up automatically
        "monitor" = ", preferred, auto, 1";
      };
    };

    wayland.windowManager.hyprland.settings.exec-once = lib.mkIf (config.hm.wm.components.waybar && !config.hm.gnome.enable) ["waybar"];
  };
}
