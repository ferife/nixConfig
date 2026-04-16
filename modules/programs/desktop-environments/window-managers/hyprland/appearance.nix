{inputs, ...}: {
  flake.modules.homeManager.hyprland = {pkgs, ...}: {
    wayland.windowManager.hyprland.settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
      };
      # decoration.inactive_opacity = 0.85;
    };
  };
}
