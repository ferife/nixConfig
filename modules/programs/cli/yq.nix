{inputs, ...}: {
  # yq is a YAML/XML/TOML processing tool
  #
  # flake.modules.nixos.yq = {pkgs, ...}: {};

  flake.modules.homeManager.yq = {pkgs, ...}: {
    home.packages = [pkgs.yq];
  };
}
