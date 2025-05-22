{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  config = lib.mkIf config.hm.gnome.generalSettings {
    home.packages = with pkgs; [
      dconf-editor # Allows for the editing of GNOME settings in NixOS
      gnome-tweaks # Find the existence of hidden settings much more easily than with dconf editor
    ];

    # To figure out where to make the changes in dconf, do the following
    # 1) Use the command `dconf dump / > old-conf.txt`
    # 2) Make the desired changes within the regular settings menu and/or gnome tweaks
    # 3) Use the command `dconf dump / > new-conf.txt`
    # 4) diff old-conf.txt and new-conf
    dconf.settings = {
      "org/gnome/desktop/calendar".show-weekdate = true;
      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
        clock-show-weekday = true;
      };
      "org/gnome/desktop/wm/preferences".focus-mode = "mouse"; # Focus follows mouse
      "org/gnome/mutter".dynamic-workspaces = true;
      "org/gnome/shell".disabled-extensions = [];
      # The line above makes it so that the list of disabled extensions is empty
      # Since the list of disabled extensions takes precedence over enabled extensions, letting it not be empty would sometimes cause extensions to not successfully enable
      # ---
      # Keybinds
      "org/gnome/desktop/wm/keybindings" = {
        close = ["<Super>q"];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = lib.mkMerge [
        {
          name = "Terminal";
          binding = "<Super>t";
        }
        (lib.mkIf (userSettings.terminal == "kitty") {command = "kitty";})
        (lib.mkIf (userSettings.terminal == "gnome-terminal") {command = "gnome-terminal";})
      ];
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = lib.mkMerge [
        {
          name = "Browser";
          binding = "<Super>b";
        }
        (lib.mkIf (userSettings.mainBrowser == "floorp") {command = "floorp";})
        (lib.mkIf (userSettings.mainBrowser == "firefox") {command = "firefox";})
      ];
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        name = "Obsidian";
        command = "obsidian";
        binding = "<Super>o";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
        name = "Password Manager";
        command = "keepassxc";
        binding = "<Super>p";
      };
    };
  };
}
