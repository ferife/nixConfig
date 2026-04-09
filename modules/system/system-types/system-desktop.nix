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

  # flake.modules.darwin.system-desktop = {
  #   imports = with inputs.self.modules.darwin; [
  #     system-cli
  #   ];
  # };

  flake.modules.homeManager.system-desktop = {
    imports = with inputs.self.modules.homeManager; [
      system-cli

      # NIX
      stylix
      #
      # PROGRAMS
      chromium
      dolphin
      ghostty
      hyprland
      # kde-plasma
      keepassxc
      lazygit
      librewolf
      mpv
      noctalia
      obs-studio
      starship
      thunderbird
      zoxide
      #
      # SERVICES
      mullvad
      #
      # SESTTINGS
      cursor
    ];
  };
}
