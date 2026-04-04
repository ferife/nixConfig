{inputs, ...}: {
  # expansion of cli system for desktop use

  flake.modules.nixos.system-desktop = {
    imports = with inputs.self.modules.nixos; [
      system-cli

      bluetooth
      clipboard
      # gdm
      # gnome
      hyprland
      io-settings
      power-settings
      regreet
      stylix
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

      clipboard
      cursor
      ghostty
      hyprland
      keepassxc
      lazygit
      librewolf
      nixvim
      noctalia
      starship
      stylix
      zoxide
    ];
  };
}
