{inputs, ...}: {
  # flake.modules.nixos.nh = {pkgs, ...}: {};

  flake.modules.homeManager.nh = {pkgs, ...}: {
    programs.nh = {
      enable = true;
    };
  };
}
