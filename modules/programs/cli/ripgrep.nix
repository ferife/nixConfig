{inputs, ...}: {
  # ripgrep is a tool that searches through files using text patterns

  flake.modules.homeManager.ripgrep = {pkgs, ...}: {
    programs.ripgrep.enable = true;
    home.shellAliases."grep" = "rg";
  };
}
