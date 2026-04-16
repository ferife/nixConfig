{inputs, ...}: {
  # bash is a shell and command-line interpreter

  flake.modules.homeManager.bash = {pkgs, ...}: {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
    };

    home.shellAliases.fc = "fc -e nvim"; # sets default editor for fc to nvim
  };
}
