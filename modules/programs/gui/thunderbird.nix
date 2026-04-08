{inputs, ...}: {
  # flake.modules.nixos.thunderbird = {pkgs, ...}: {};

  flake.modules.homeManager.thunderbird = {pkgs, ...}: {
    programs.thunderbird = {
      enable = true;
    };
  };
}
