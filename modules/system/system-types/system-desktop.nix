{inputs, ...}: {
  # expansion of cli system for desktop use

  flake.modules.nixos.system-desktop = {
    imports = with inputs.self.modules.nixos; [
      system-cli

      # NIX
      stylix
      #
      # PROGRAMS
      # gdm
      # ghostty
      # gnome
      hyprland
      # kde-connect
      # kde-plasma
      regreet
      # sddm
      #
      # SETTINGS
      bluetooth
      io-settings
      power-settings
      # x11
    ];
  };

  flake.modules.homeManager.system-desktop = {
    imports = with inputs.self.modules.homeManager; [
      system-cli

      # NIX
      stylix
      #
      # PROGRAMS
      chromium
      dolphin
      eclipse
      ghostty
      hyprland
      # kde-connect
      # kde-plasma
      keepassxc
      lazygit
      libreoffice
      librewolf
      mpv
      noctalia
      obs-studio
      starship
      thunderbird
      tor-browser
      zoxide
      #
      # SERVICES
      mullvad
      #
      # SETTINGS
      cursor
      notifications
    ];
  };
}
