{inputs, ...}: {
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
