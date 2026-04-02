{inputs, ...}: {
  # flake.modules.nixos.ghostty = {pkgs, ...}: {};

  flake.modules.homeManager.ghostty = {pkgs, ...}: {
    programs.ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      systemd.enable = true;
    };
  };
}
