{inputs, ...}: {
  # flake.modules.nixos.git = {pkgs, ...}: {};

  flake.modules.homeManager.git = {pkgs, ...}: {
    programs.git = {
      enable = true;
    };
  };
}
