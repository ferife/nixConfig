{inputs, ...}: {
  # jq is a JSON processing tool
  #
  # flake.modules.nixos.jq = {pkgs, ...}: {};

  flake.modules.homeManager.jq = {pkgs, ...}: {
    programs.jq.enable = true;
  };
}
