{inputs, ...}: {
  flake.modules.homeManager.nixvim-which-key = {pkgs, ...}: {
    plugins.which-key.enable = true;
  };
}
