{inputs, ...}: {
  flake.modules.homeManager.nixvim-pairs = {pkgs, ...}: {
    plugins.mini-pairs.enable = true;
  };
}
