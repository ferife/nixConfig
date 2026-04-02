{inputs, ...}: {
  # flake.modules.nixos.librewolf = {pkgs, ...}: {};

  flake.modules.homeManager.librewolf = {pkgs, ...}: {
    programs.librewolf = {
      enable = true;
    };
  };
}
