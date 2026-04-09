{inputs, ...}: {
  # zoxide is a tool made to easily traverse file systems
  #
  # flake.modules.nixos.zoxide = {pkgs, ...}: {};

  flake.modules.homeManager.zoxide = {pkgs, ...}: {
    programs.fzf.enable = true;

    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
