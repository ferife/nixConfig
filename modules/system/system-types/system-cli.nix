{inputs, ...}: {
  # expansion of default system with basic system settings & cli-tools

  flake.modules.nixos.system-cli = {
    imports = with inputs.self.modules.nixos; [
      system-default

      # NIX
      comma
      nh
      nix-index-database
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
      comma
      nh
      nix-index-database
      #
      # PROGRAMS
      alejandra
      # bash
      bc
      fastfetch
      fd
      fzf
      git
      # grep
      jq
      nixvim
      playerctl
      procs
      ripgrep
      # yq
      zsh
      #
      # SERVICES
      clipboard
    ];
  };
}
