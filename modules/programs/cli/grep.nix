{inputs, ...}: {
  # grep is a tool that searches through files using text patterns

  flake.modules.homeManager.grep = {pkgs, ...}: {
    home.shellAliases."grep" = "grep --color";
  };
}
