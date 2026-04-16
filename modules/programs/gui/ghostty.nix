{inputs, ...}: {
  # Ghostty is a terminal emulator

  flake.modules.nixos.ghostty = {pkgs, ...}: {
    environment.systemPackages = [pkgs.ghostty];
  };

  flake.modules.homeManager.ghostty = {pkgs, ...}: {
    programs.ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      systemd.enable = true;

      clearDefaultKeybinds = true;

      settings.keybind = [
        "ctrl+shift+i=inspector:toggle"
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+zero=reset_font_size"

        "ctrl+left=adjust_selection:left"
        "ctrl+down=adjust_selection:down"
        "ctrl+up=adjust_selection:up"
        "ctrl+right=adjust_selection:right"
      ];
    };
    dconf.settings."org/gnome/shell".favorite-apps = ["com.mitchellh.ghostty.desktop"];
  };
}
