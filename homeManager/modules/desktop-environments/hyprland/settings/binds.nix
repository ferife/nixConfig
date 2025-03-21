{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.enable {
    wayland.windowManager.hyprland.settings = lib.mkMerge [
      # Format for a bindd with questions:
      # "MODS, key, description, dispatcher, params"
      # TODO: make the specific terminal and browser depend on userSettings
      {
        bindd = ["$mainMod, q, Close the current window, killactive"];
      }
      (lib.mkIf config.hm.kitty {
        bindd = ["$mainMod, T, Open a terminal window, exec, kitty"];
      })
      (lib.mkIf config.hm.firefox {
        bindd = ["$mainMod, B, Open a browser window, exec, firefox"];
      })
      (lib.mkIf config.hm.hyprland.wofi {
        bindd = ["$mainMod, A, Open the app launcher, exec, wofi --show drun --allow-images"];
      })
    ];
  };
}
