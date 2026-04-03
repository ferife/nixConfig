{inputs, ...}: {
  # flake.modules.nixos.grep = {pkgs, ...}: {};

  flake.modules.homeManager.grep = {pkgs, ...}: {
    home.shellAliases = {
      "grep" = "grep --color";
    };
  };
}
