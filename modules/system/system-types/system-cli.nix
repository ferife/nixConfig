{inputs, ...}: {
  # expansion of default system with basic system settings & cli-tools

  flake.modules.nixos.system-cli = {
    imports = with inputs.self.modules.nixos; [
      system-default

      # NIX
      nh
      #
      # SERVICES
      clipboard
      mullvad
      # ssh
      #
      # SETTINGS
      location-settings
      network-settings
    ];
  };

  flake.modules.homeManager.system-cli = {
    imports = with inputs.self.modules.homeManager; [
      system-default

      # NIX
      nh
      #
      # PROGRAMS
      alejandra
      fzf
      git
      # grep
      jq
      nixvim
      ripgrep
      zsh
      #
      # SERVICES
      clipboard
    ];
  };
}
