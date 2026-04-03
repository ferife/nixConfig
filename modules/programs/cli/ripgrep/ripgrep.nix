{inputs, ...}: {
  # flake.modules.nixos.ripgrep = {pkgs, ...}: {};

  flake.modules.homeManager.ripgrep = {pkgs, ...}: {
    programs.ripgrep.enable = true;
    home.shellAliases = {
      "grep" = "rg";
    };
  };
}
