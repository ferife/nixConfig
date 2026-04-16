{inputs, ...}: {
  flake.modules.homeManager.nixvim-intellitab = {pkgs, ...}: {
    plugins.intellitab.enable = true;
  };
}
