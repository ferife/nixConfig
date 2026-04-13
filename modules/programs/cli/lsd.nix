{inputs, ...}: {
  # lsd is a tool that searches through files using text patterns
  #
  # flake.modules.nixos.lsd = {pkgs, ...}: {};

  flake.modules.homeManager.lsd = {pkgs, ...}: {
    programs.lsd = {
      enable = true;
      enableAliases = true;
    };
  };
}
