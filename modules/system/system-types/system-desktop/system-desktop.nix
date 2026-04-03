{inputs, ...}: {
  # expansion of cli system for desktop use

  flake.modules.nixos.system-desktop = {
    imports = with inputs.self.modules.nixos; [
      system-cli

      bluetooth
      # gdm
      # gnome
      hyprland
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
