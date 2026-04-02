{inputs, ...}: {
  # flake.modules.nixos.jq = {pkgs, ...}: {};

  flake.modules.homeManager.jq = {pkgs, ...}: {
    programs.jq = {
      enable = true;
    };
  };
}
