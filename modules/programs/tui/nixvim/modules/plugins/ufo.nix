{
  inputs,
  config,
  ...
}: {
  flake.modules.homeManager.nixvim-ufo = {lib, ...}: {
    plugins.nvim-ufo.enable = true;
  };
}
