{inputs, ...}: {
  flake.modules.homeManager.autostart = {pkgs, ...}: {
    xdg.autostart.enable = true;
    wayland.windowManager.hyprland.systemd.enableXdgAutostart = true;
  };
}
