{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    hm.scripts = {
      hypr-kill-all-instances.enable = true;
    };

    # Format for a bindd with questions:
    # "MODS, key, description, dispatcher, params"

    wayland.windowManager.hyprland.settings = lib.mkMerge [
      # Basics
      {
        bindd = let
          kill-all-instances = config.hm.scripts.hypr-kill-all-instances.full-path;
        in [
          "$mainMod, Q, Close the current window, killactive"
          "$mainMod SHIFT, Q, Close all instances of application in active window, exec, ${kill-all-instances}"
          "$mainMod, F, Fullscreen active window, fullscreen, 0"
          "$mainMod, M, Maximize active window, fullscreen, 1"
        ];
      }

      # Mouse Binds
      {
        bindmd = [
          "$mainMod, mouse:272, LMB move window, movewindow"
          "$mainMod, mouse:273, RMB move window, resizewindow"
        ];
      }

      # Moving between workspaces
      {
        bindd = [
          "$mainMod, 1, Go to workspace 1, workspace, 1"
          "$mainMod, 2, Go to workspace 2, workspace, 2"
          "$mainMod, 3, Go to workspace 3, workspace, 3"
          "$mainMod, 4, Go to workspace 4, workspace, 4"
          "$mainMod, 5, Go to workspace 5, workspace, 5"
          "$mainMod, 6, Go to workspace 6, workspace, 6"
          "$mainMod, 7, Go to workspace 7, workspace, 7"
          "$mainMod, 8, Go to workspace 8, workspace, 8"
          "$mainMod, 9, Go to workspace 9, workspace, 9"
          "$mainMod, 0, Go to workspace 10, workspace, 10"
          "$mainMod SHIFT, 1, Move active window to workspace 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, Move active window to workspace 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, Move active window to workspace 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, Move active window to workspace 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, Move active window to workspace 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, Move active window to workspace 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, Move active window to workspace 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, Move active window to workspace 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, Move active window to workspace 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, Move active window to workspace 10, movetoworkspace, 10"
        ];
      }

      # Moving window focus
      {
        bindd = [
          "$mainMod, H, Move window focus to the left, movefocus, l"
          "$mainMod, J, Move window focus to the left, movefocus, d"
          "$mainMod, K, Move window focus to the left, movefocus, u"
          "$mainMod, L, Move window focus to the left, movefocus, r"

          "$mainMod, left, Move window focus to the left, movefocus, l"
          "$mainMod, down, Move window focus to the left, movefocus, d"
          "$mainMod, up, Move window focus to the left, movefocus, u"
          "$mainMod, right, Move window focus to the left, movefocus, r"
        ];
      }

      # Moving windows
      {
        binde = [
          "$mainMod SHIFT, H, swapwindow, l"
          "$mainMod SHIFT, J, swapwindow, d"
          "$mainMod SHIFT, K, swapwindow, u"
          "$mainMod SHIFT, L, swapwindow, r"

          "$mainMod SHIFT, left, swapwindow, l"
          "$mainMod SHIFT, down, swapwindow, d"
          "$mainMod SHIFT, up, swapwindow, u"
          "$mainMod SHIFT, right, swapwindow, r"
        ];
      }

      # Terminal
      {
        bindd = let
          terminal = config.hm.specialArgs.user-settings.terminal;
        in [
          "$mainMod, return, Open a terminal window, exec, ${terminal}"
        ];
      }

      # Browser
      {
        bindd = let
          browser = config.hm.specialArgs.user-settings.browser;
        in [
          "$mainMod, B, Open a browser window, exec, ${browser}"
        ];
      }

      # App Launcher
      (lib.mkIf (config.hm.wm.app-launcher == "rofi") {
        bindd = ["$mainMod, A, Open the app launcher, exec, rofi -show drun"];
      })
      (lib.mkIf (config.hm.wm.app-launcher == "wofi") {
        bindd = ["$mainMod, A, Open the app launcher, exec, wofi --show drun --allow-images"];
      })

      # Other Apps
      (lib.mkIf config.hm.obsidian {
        bindd = ["$mainMod, O, Open Obsidian, exec, obsidian"];
      })
      (lib.mkIf config.hm.keepassxc {
        bindd = ["$mainMod, P, Open the password manager, exec, keepassxc"];
      })
    ];
  };
}
