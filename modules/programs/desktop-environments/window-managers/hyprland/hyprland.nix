{inputs, ...}: {
  # Hyprland is a tiling window manager

  flake.modules.nixos.hyprland = {pkgs, ...}: {
    environment.variables.NIXOS_OZONE_WL = "1";

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };
  };

  flake.modules.homeManager.hyprland = {pkgs, ...}: {
    # hint Electron apps to use Wayland
    home.sessionVariables.NIXOS_OZONE_WL = "1";
    home.pointerCursor.hyprcursor.enable = true;

    wayland.windowManager.hyprland = {
      # allow home manager to configure hyprland
      enable = true;
      systemd.enable = true;
      settings = {
        input.touchpad.disable_while_typing = true;

        # Any monitors whose settings are not explicitly defined will be set up automatically
        "monitor" = ", preferred, auto, 1";
        misc.vfr = true;
      };
      systemd.enableXdgAutostart = true;
    };
    services.hyprpolkitagent.enable = true;
  };
}
