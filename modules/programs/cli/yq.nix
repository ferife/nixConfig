{inputs, ...}: {
  # yq is a YAML/XML/TOML processing tool

  flake.modules.homeManager.yq = {pkgs, ...}: {
    home.packages = [pkgs.yq];
  };
}
