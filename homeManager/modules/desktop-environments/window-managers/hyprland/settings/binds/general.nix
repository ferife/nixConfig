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
          "SUPER, Q, Close the current window, killactive"
          "SUPER SHIFT, Q, Close all instances of application in active window, exec, ${kill-all-instances}"
          "SUPER, F, Fullscreen active window, fullscreen, 0"
          "SUPER ALT, F, Maximize active window, fullscreen, 1"
          # "SUPER, J, Toggle window split, layoutmsg, togglesplit" # WARN: Super+J taken already
        ];
        binddu = [
          "SUPER, escape, Exit submap, submap, reset"
        ];
      }

      # Mouse Binds
      {
        binddm = [
          "SUPER, mouse:272, LMB move window, movewindow"
          "SUPER, mouse:273, RMB move window, resizewindow"
        ];
      }

      # Moving between workspaces
      {
        bindd = [
          "SUPER, 1, Go to workspace 1, workspace, 1"
          "SUPER, 2, Go to workspace 2, workspace, 2"
          "SUPER, 3, Go to workspace 3, workspace, 3"
          "SUPER, 4, Go to workspace 4, workspace, 4"
          "SUPER, 5, Go to workspace 5, workspace, 5"
          "SUPER, 6, Go to workspace 6, workspace, 6"
          "SUPER, 7, Go to workspace 7, workspace, 7"
          "SUPER, 8, Go to workspace 8, workspace, 8"
          "SUPER, 9, Go to workspace 9, workspace, 9"
          "SUPER, 0, Go to workspace 10, workspace, 10"
          "SUPER SHIFT, 1, Move active window to workspace 1, movetoworkspace, 1"
          "SUPER SHIFT, 2, Move active window to workspace 2, movetoworkspace, 2"
          "SUPER SHIFT, 3, Move active window to workspace 3, movetoworkspace, 3"
          "SUPER SHIFT, 4, Move active window to workspace 4, movetoworkspace, 4"
          "SUPER SHIFT, 5, Move active window to workspace 5, movetoworkspace, 5"
          "SUPER SHIFT, 6, Move active window to workspace 6, movetoworkspace, 6"
          "SUPER SHIFT, 7, Move active window to workspace 7, movetoworkspace, 7"
          "SUPER SHIFT, 8, Move active window to workspace 8, movetoworkspace, 8"
          "SUPER SHIFT, 9, Move active window to workspace 9, movetoworkspace, 9"
          "SUPER SHIFT, 0, Move active window to workspace 10, movetoworkspace, 10"
          "SUPER ALT SHIFT, 1, Move active window to workspace 1, movetoworkspacesilent, 1"
          "SUPER ALT SHIFT, 2, Move active window to workspace 2, movetoworkspacesilent, 2"
          "SUPER ALT SHIFT, 3, Move active window to workspace 3, movetoworkspacesilent, 3"
          "SUPER ALT SHIFT, 4, Move active window to workspace 4, movetoworkspacesilent, 4"
          "SUPER ALT SHIFT, 5, Move active window to workspace 5, movetoworkspacesilent, 5"
          "SUPER ALT SHIFT, 6, Move active window to workspace 6, movetoworkspacesilent, 6"
          "SUPER ALT SHIFT, 7, Move active window to workspace 7, movetoworkspacesilent, 7"
          "SUPER ALT SHIFT, 8, Move active window to workspace 8, movetoworkspacesilent, 8"
          "SUPER ALT SHIFT, 9, Move active window to workspace 9, movetoworkspacesilent, 9"
          "SUPER ALT SHIFT, 0, Move active window to workspace 10, movetoworkspacesilent, 10"

          "SUPER, TAB, Go to next workspace, workspace, e+1"
          "SUPER SHIFT, TAB, Go to previous workspace, workspace, e-1"
          "SUPER CTRL, TAB, Go to former workspace, workspace, previous"
        ];
      }

      # Moving window focus
      {
        bindd = [
          "SUPER, H, Move window focus to the left, movefocus, l"
          "SUPER, J, Move window focus to the left, movefocus, d"
          "SUPER, K, Move window focus to the left, movefocus, u"
          "SUPER, L, Move window focus to the left, movefocus, r"

          "SUPER, left, Move window focus to the left, movefocus, l"
          "SUPER, down, Move window focus to the left, movefocus, d"
          "SUPER, up, Move window focus to the left, movefocus, u"
          "SUPER, right, Move window focus to the left, movefocus, r"
        ];
      }

      # Moving windows
      {
        bindde = [
          "SUPER SHIFT, H, swap window leftwards, swapwindow, l"
          "SUPER SHIFT, J, swap window downwards, swapwindow, d"
          "SUPER SHIFT, K, swap window upwards, swapwindow, u"
          "SUPER SHIFT, L, swap window rightwards, swapwindow, r"

          "SUPER SHIFT, left, swap window leftwards, swapwindow, l"
          "SUPER SHIFT, down, swap window downwards, swapwindow, d"
          "SUPER SHIFT, up, swap window upwards, swapwindow, u"
          "SUPER SHIFT, right, swap window rightwards, swapwindow, r"
        ];
      }

      # Terminal
      {
        bindd = let
          terminal = config.hm.specialArgs.user-settings.terminal;
        in ["SUPER, return, Open a terminal window, exec, ${terminal}"];
      }

      # Browser
      {
        bindd = let
          browser = config.hm.specialArgs.user-settings.browser;
        in ["SUPER SHIFT, return, Open a browser window, exec, ${browser}"];
      }

      # App Launcher
      (lib.mkIf (config.hm.wm.app-launcher == "rofi") {
        bindd = ["SUPER, Space, Open the app launcher, exec, rofi -show drun"];
      })
      (lib.mkIf (config.hm.wm.app-launcher == "wofi") {
        bindd = ["SUPER, Space, Open the app launcher, exec, wofi --show drun --allow-images"];
      })

      # Other Apps
      (lib.mkIf config.hm.obsidian {
        bindd = ["SUPER, O, Open Obsidian, exec, obsidian"];
      })
      (lib.mkIf config.hm.keepassxc {
        bindd = ["SUPER, P, Open the password manager, exec, keepassxc"];
      })
    ];
  };
}
